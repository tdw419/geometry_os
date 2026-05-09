; DESCRIPTION: Renders a purple box of size 113x51 starting at (303, 152).
; PLAN: r0=303(x), r1=152(y), r2=113(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 152
LDI r2, 113
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
