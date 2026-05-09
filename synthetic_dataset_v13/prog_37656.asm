; DESCRIPTION: Places a white line segment connecting (8, 154) to (222, 230).
; PLAN: r0=8(x1), r1=154(y1), r2=222(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 154
LDI r2, 222
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
