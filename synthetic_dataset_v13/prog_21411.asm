; DESCRIPTION: Places a orange line segment connecting (97, 19) to (235, 154).
; PLAN: r0=97(x1), r1=19(y1), r2=235(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 19
LDI r2, 235
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
