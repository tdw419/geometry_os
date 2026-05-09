; DESCRIPTION: Places a yellow line segment connecting (278, 205) to (329, 230).
; PLAN: r0=278(x1), r1=205(y1), r2=329(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 205
LDI r2, 329
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
