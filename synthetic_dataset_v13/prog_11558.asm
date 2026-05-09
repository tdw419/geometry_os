; DESCRIPTION: Renders a black box of size 106x51 starting at (152, 68).
; PLAN: r0=152(x), r1=68(y), r2=106(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 68
LDI r2, 106
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
