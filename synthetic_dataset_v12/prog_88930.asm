; DESCRIPTION: Creates a green rectangular region at (354, 51) spanning 34 by 78 pixels.
; PLAN: r0=354(x), r1=51(y), r2=34(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 51
LDI r2, 34
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
