; DESCRIPTION: Places a black line segment connecting (154, 26) to (209, 3).
; PLAN: r0=154(x1), r1=26(y1), r2=209(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 26
LDI r2, 209
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
