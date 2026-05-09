; DESCRIPTION: Places a yellow line segment connecting (281, 127) to (84, 190).
; PLAN: r0=281(x1), r1=127(y1), r2=84(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 127
LDI r2, 84
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
