; DESCRIPTION: Places a green line segment connecting (127, 160) to (68, 222).
; PLAN: r0=127(x1), r1=160(y1), r2=68(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 160
LDI r2, 68
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
