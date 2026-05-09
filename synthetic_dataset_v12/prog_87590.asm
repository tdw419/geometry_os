; DESCRIPTION: Places a yellow line segment connecting (144, 213) to (420, 50).
; PLAN: r0=144(x1), r1=213(y1), r2=420(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 213
LDI r2, 420
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
