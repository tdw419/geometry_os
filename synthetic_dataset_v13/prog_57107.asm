; DESCRIPTION: Places a blue line segment connecting (308, 33) to (276, 154).
; PLAN: r0=308(x1), r1=33(y1), r2=276(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 33
LDI r2, 276
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
