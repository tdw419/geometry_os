; DESCRIPTION: Renders a black line between points (368, 185) and (154, 22).
; PLAN: r0=368(x1), r1=185(y1), r2=154(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 185
LDI r2, 154
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
