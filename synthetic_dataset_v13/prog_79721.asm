; DESCRIPTION: Renders a blue line between points (413, 236) and (254, 188).
; PLAN: r0=413(x1), r1=236(y1), r2=254(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 236
LDI r2, 254
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
