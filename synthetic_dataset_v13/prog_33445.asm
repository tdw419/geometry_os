; DESCRIPTION: Composite: Draws a green circle centered at (344, 139) with radius 11 then Renders a red line between points (354, 104) and (286, 48) then Creates a cyan rectangular region at (407, 157) spanning 90 by 52 pixels.
; PLAN: r0=344(x), r1=139(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x1), r6=104(y1), r7=286(x2), r8=48(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=157(y), r12=90(width), r13=52(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 139
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 104
LDI r7, 286
LDI r8, 48
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 157
LDI r12, 90
LDI r13, 52
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
