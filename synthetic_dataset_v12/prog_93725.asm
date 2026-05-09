; DESCRIPTION: Draws a purple line from (144, 137) to (305, 19).
; PLAN: r0=144(x1), r1=137(y1), r2=305(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 137
LDI r2, 305
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
