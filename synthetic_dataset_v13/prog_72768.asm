; DESCRIPTION: Creates a yellow rectangular region at (430, 0) spanning 63 by 51 pixels.
; PLAN: r0=430(x), r1=0(y), r2=63(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 0
LDI r2, 63
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
