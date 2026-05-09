; DESCRIPTION: Places a black line segment connecting (412, 227) to (154, 154).
; PLAN: r0=412(x1), r1=227(y1), r2=154(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 227
LDI r2, 154
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
