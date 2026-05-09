; DESCRIPTION: Places a yellow line segment connecting (154, 83) to (362, 163).
; PLAN: r0=154(x1), r1=83(y1), r2=362(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 83
LDI r2, 362
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
