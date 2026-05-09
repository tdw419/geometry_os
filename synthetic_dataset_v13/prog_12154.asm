; DESCRIPTION: Composite: Creates a cyan rectangular region at (317, 110) spanning 61 by 32 pixels then Places a green line segment connecting (301, 139) to (321, 135) then Draws a cyan circle centered at (131, 104) with radius 33.
; PLAN: r0=317(x), r1=110(y), r2=61(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x1), r6=139(y1), r7=321(x2), r8=135(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=104(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 110
LDI r2, 61
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 139
LDI r7, 321
LDI r8, 135
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 104
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
