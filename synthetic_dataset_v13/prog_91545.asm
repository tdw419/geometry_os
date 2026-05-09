; DESCRIPTION: Places a yellow line segment connecting (45, 219) to (502, 154).
; PLAN: r0=45(x1), r1=219(y1), r2=502(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 219
LDI r2, 502
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
