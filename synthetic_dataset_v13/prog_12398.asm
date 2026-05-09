; DESCRIPTION: Places a black line segment connecting (261, 126) to (372, 154).
; PLAN: r0=261(x1), r1=126(y1), r2=372(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 126
LDI r2, 372
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
