; DESCRIPTION: Composite: Places a magenta line segment connecting (305, 40) to (142, 68) then Sets a single black pixel at (204, 34).
; PLAN: r0=305(x1), r1=40(y1), r2=142(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 40
LDI r2, 142
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
HALT
