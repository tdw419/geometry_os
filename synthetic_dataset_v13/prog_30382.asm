; DESCRIPTION: Places a magenta line segment connecting (479, 20) to (24, 162).
; PLAN: r0=479(x1), r1=20(y1), r2=24(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 20
LDI r2, 24
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
