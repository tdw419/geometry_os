; DESCRIPTION: Places a magenta line segment connecting (13, 98) to (231, 204).
; PLAN: r0=13(x1), r1=98(y1), r2=231(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 98
LDI r2, 231
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
