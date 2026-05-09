; DESCRIPTION: Places a black line segment connecting (445, 155) to (27, 154).
; PLAN: r0=445(x1), r1=155(y1), r2=27(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 155
LDI r2, 27
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
