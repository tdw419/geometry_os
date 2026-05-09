; DESCRIPTION: Renders a orange line between points (192, 251) and (479, 248).
; PLAN: r0=192(x1), r1=251(y1), r2=479(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 251
LDI r2, 479
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
