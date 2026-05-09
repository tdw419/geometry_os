; DESCRIPTION: Places a purple line segment connecting (65, 32) to (209, 154).
; PLAN: r0=65(x1), r1=32(y1), r2=209(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 32
LDI r2, 209
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
