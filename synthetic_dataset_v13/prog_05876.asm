; DESCRIPTION: Renders a purple line between points (415, 91) and (137, 236).
; PLAN: r0=415(x1), r1=91(y1), r2=137(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 91
LDI r2, 137
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
