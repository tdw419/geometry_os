; DESCRIPTION: Renders a black line between points (176, 152) and (135, 181).
; PLAN: r0=176(x1), r1=152(y1), r2=135(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 152
LDI r2, 135
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
