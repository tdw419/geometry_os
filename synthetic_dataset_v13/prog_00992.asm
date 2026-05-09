; DESCRIPTION: Renders a green line between points (270, 45) and (198, 97).
; PLAN: r0=270(x1), r1=45(y1), r2=198(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 45
LDI r2, 198
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
