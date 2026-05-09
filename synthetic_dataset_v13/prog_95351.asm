; DESCRIPTION: Places a magenta line segment connecting (23, 75) to (479, 153).
; PLAN: r0=23(x1), r1=75(y1), r2=479(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 75
LDI r2, 479
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
