; DESCRIPTION: Composite: Places a blue line segment connecting (473, 155) to (5, 207) then Creates a white rectangular region at (234, 182) spanning 75 by 46 pixels.
; PLAN: r0=473(x1), r1=155(y1), r2=5(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=182(y), r7=75(width), r8=46(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 155
LDI r2, 5
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 182
LDI r7, 75
LDI r8, 46
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
