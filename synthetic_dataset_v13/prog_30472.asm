; DESCRIPTION: Renders a black line between points (352, 172) and (88, 152).
; PLAN: r0=352(x1), r1=172(y1), r2=88(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 172
LDI r2, 88
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
