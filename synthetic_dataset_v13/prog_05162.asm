; DESCRIPTION: Renders a purple line between points (492, 148) and (352, 188).
; PLAN: r0=492(x1), r1=148(y1), r2=352(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 148
LDI r2, 352
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
