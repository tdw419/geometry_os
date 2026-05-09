; DESCRIPTION: Composite: Draws a yellow line from (48, 53) to (462, 40) then Creates a white rectangular region at (157, 75) spanning 22 by 23 pixels.
; PLAN: r0=48(x1), r1=53(y1), r2=462(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=75(y), r7=22(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 53
LDI r2, 462
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 75
LDI r7, 22
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
