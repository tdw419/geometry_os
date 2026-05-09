; DESCRIPTION: Creates a white rectangular region at (483, 131) spanning 29 by 25 pixels.
; PLAN: r0=483(x), r1=131(y), r2=29(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 131
LDI r2, 29
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
