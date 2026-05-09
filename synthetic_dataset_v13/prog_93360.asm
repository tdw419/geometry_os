; DESCRIPTION: Renders a black line between points (398, 147) and (90, 195).
; PLAN: r0=398(x1), r1=147(y1), r2=90(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 147
LDI r2, 90
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
