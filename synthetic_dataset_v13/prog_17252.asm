; DESCRIPTION: Renders a purple line between points (479, 216) and (122, 8).
; PLAN: r0=479(x1), r1=216(y1), r2=122(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 216
LDI r2, 122
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
