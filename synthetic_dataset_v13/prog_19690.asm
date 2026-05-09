; DESCRIPTION: Renders a black box of size 113x75 starting at (79, 51).
; PLAN: r0=79(x), r1=51(y), r2=113(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 51
LDI r2, 113
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
