; DESCRIPTION: Places a blue line segment connecting (21, 196) to (328, 154).
; PLAN: r0=21(x1), r1=196(y1), r2=328(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 196
LDI r2, 328
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
