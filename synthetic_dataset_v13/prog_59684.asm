; DESCRIPTION: Renders a black box of size 89x46 starting at (55, 79).
; PLAN: r0=55(x), r1=79(y), r2=89(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 79
LDI r2, 89
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
