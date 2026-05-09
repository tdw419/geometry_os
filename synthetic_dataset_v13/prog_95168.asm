; DESCRIPTION: Places a black line segment connecting (231, 20) to (70, 154).
; PLAN: r0=231(x1), r1=20(y1), r2=70(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 20
LDI r2, 70
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
