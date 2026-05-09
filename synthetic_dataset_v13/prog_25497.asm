; DESCRIPTION: Renders a purple line between points (352, 95) and (370, 83).
; PLAN: r0=352(x1), r1=95(y1), r2=370(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 95
LDI r2, 370
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
