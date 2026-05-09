; DESCRIPTION: Places a orange line segment connecting (379, 180) to (479, 65).
; PLAN: r0=379(x1), r1=180(y1), r2=479(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 180
LDI r2, 479
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
