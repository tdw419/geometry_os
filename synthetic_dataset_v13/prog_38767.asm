; DESCRIPTION: Composite: Draws a cyan circle centered at (61, 161) with radius 59 then Places a cyan line segment connecting (453, 115) to (414, 149).
; PLAN: r0=61(x), r1=161(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x1), r6=115(y1), r7=414(x2), r8=149(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 161
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 115
LDI r7, 414
LDI r8, 149
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
