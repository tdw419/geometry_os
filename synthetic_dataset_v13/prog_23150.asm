; DESCRIPTION: Places a yellow line segment connecting (190, 37) to (180, 9).
; PLAN: r0=190(x1), r1=37(y1), r2=180(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 37
LDI r2, 180
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
