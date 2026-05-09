; DESCRIPTION: Renders a black box of size 70x79 starting at (50, 77).
; PLAN: r0=50(x), r1=77(y), r2=70(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 77
LDI r2, 70
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
