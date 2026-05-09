; DESCRIPTION: Renders a black line between points (106, 188) and (271, 195).
; PLAN: r0=106(x1), r1=188(y1), r2=271(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 188
LDI r2, 271
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
