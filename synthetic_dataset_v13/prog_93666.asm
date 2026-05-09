; DESCRIPTION: Places a orange line segment connecting (479, 48) to (462, 127).
; PLAN: r0=479(x1), r1=48(y1), r2=462(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 48
LDI r2, 462
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
