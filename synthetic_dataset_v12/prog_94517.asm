; DESCRIPTION: Creates a black rectangular region at (187, 88) spanning 51 by 85 pixels.
; PLAN: r0=187(x), r1=88(y), r2=51(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 88
LDI r2, 51
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
