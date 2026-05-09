; DESCRIPTION: Creates a yellow rectangular region at (197, 131) spanning 89 by 57 pixels.
; PLAN: r0=197(x), r1=131(y), r2=89(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 131
LDI r2, 89
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
