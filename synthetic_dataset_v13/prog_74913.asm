; DESCRIPTION: Places a magenta line segment connecting (373, 222) to (281, 206).
; PLAN: r0=373(x1), r1=222(y1), r2=281(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 222
LDI r2, 281
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
