; DESCRIPTION: Places a black line segment connecting (294, 242) to (311, 58).
; PLAN: r0=294(x1), r1=242(y1), r2=311(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 242
LDI r2, 311
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
