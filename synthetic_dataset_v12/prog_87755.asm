; DESCRIPTION: Draws a black line from (92, 88) to (252, 205).
; PLAN: r0=92(x1), r1=88(y1), r2=252(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 88
LDI r2, 252
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
