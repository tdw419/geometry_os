; DESCRIPTION: Places a yellow line segment connecting (189, 18) to (45, 27).
; PLAN: r0=189(x1), r1=18(y1), r2=45(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 18
LDI r2, 45
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
