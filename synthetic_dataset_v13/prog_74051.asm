; DESCRIPTION: Composite: Places a orange circle of radius 70 at center (302, 183) then Draws a blue line from (332, 82) to (116, 231).
; PLAN: r0=302(x), r1=183(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=82(y1), r7=116(x2), r8=231(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 183
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 82
LDI r7, 116
LDI r8, 231
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
