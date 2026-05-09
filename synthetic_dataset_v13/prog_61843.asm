; DESCRIPTION: Places a black line segment connecting (177, 38) to (399, 154).
; PLAN: r0=177(x1), r1=38(y1), r2=399(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 38
LDI r2, 399
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
