; DESCRIPTION: Places a green line segment connecting (420, 32) to (248, 203).
; PLAN: r0=420(x1), r1=32(y1), r2=248(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 32
LDI r2, 248
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
