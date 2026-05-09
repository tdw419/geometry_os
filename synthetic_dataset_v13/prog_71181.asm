; DESCRIPTION: Renders a black line between points (160, 179) and (173, 185).
; PLAN: r0=160(x1), r1=179(y1), r2=173(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 179
LDI r2, 173
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
