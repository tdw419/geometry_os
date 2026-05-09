; DESCRIPTION: Creates a green rectangular region at (41, 10) spanning 51 by 79 pixels.
; PLAN: r0=41(x), r1=10(y), r2=51(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 10
LDI r2, 51
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
