; DESCRIPTION: Renders a black box of size 70x37 starting at (303, 51).
; PLAN: r0=303(x), r1=51(y), r2=70(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 51
LDI r2, 70
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
