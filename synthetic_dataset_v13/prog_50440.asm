; DESCRIPTION: Places a orange line segment connecting (105, 154) to (479, 248).
; PLAN: r0=105(x1), r1=154(y1), r2=479(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 154
LDI r2, 479
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
