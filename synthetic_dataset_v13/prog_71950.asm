; DESCRIPTION: Composite: Places a yellow circle of radius 42 at center (89, 212) then Places a blue line segment connecting (302, 12) to (280, 56).
; PLAN: r0=89(x), r1=212(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=12(y1), r7=280(x2), r8=56(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 212
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 12
LDI r7, 280
LDI r8, 56
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
