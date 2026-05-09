; DESCRIPTION: Places a magenta line segment connecting (192, 11) to (410, 63).
; PLAN: r0=192(x1), r1=11(y1), r2=410(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 11
LDI r2, 410
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
