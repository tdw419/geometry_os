; DESCRIPTION: Places a green line segment connecting (113, 222) to (249, 212).
; PLAN: r0=113(x1), r1=222(y1), r2=249(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 222
LDI r2, 249
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
