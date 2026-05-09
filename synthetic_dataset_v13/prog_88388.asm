; DESCRIPTION: Places a green line segment connecting (264, 159) to (385, 74).
; PLAN: r0=264(x1), r1=159(y1), r2=385(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 159
LDI r2, 385
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
