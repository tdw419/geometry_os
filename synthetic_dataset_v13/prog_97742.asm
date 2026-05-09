; DESCRIPTION: Places a black line segment connecting (218, 211) to (39, 154).
; PLAN: r0=218(x1), r1=211(y1), r2=39(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 211
LDI r2, 39
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
