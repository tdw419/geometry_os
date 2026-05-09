; DESCRIPTION: Places a black line segment connecting (23, 166) to (209, 10).
; PLAN: r0=23(x1), r1=166(y1), r2=209(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 166
LDI r2, 209
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
