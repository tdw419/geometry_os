; DESCRIPTION: Creates a yellow rectangular region at (223, 131) spanning 45 by 92 pixels.
; PLAN: r0=223(x), r1=131(y), r2=45(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 131
LDI r2, 45
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
