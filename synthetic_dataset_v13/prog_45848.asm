; DESCRIPTION: Composite: Creates a red rectangular region at (174, 25) spanning 33 by 43 pixels then Places a cyan line segment connecting (407, 139) to (417, 127) then Places a black circle of radius 22 at center (380, 183).
; PLAN: r0=174(x), r1=25(y), r2=33(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=139(y1), r7=417(x2), r8=127(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=183(y), r12=22(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 25
LDI r2, 33
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 139
LDI r7, 417
LDI r8, 127
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 183
LDI r12, 22
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
