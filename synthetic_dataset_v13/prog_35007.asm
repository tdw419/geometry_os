; DESCRIPTION: Places a orange line segment connecting (319, 225) to (479, 85).
; PLAN: r0=319(x1), r1=225(y1), r2=479(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 225
LDI r2, 479
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
