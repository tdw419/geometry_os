; DESCRIPTION: Places a magenta line segment connecting (479, 160) to (326, 89).
; PLAN: r0=479(x1), r1=160(y1), r2=326(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 160
LDI r2, 326
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
