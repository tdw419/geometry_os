; DESCRIPTION: Renders a black box of size 12x51 starting at (290, 18).
; PLAN: r0=290(x), r1=18(y), r2=12(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 18
LDI r2, 12
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
