; DESCRIPTION: Composite: Renders a red disk with center (246, 112) and radius 62 then Creates a cyan rectangular region at (442, 104) spanning 48 by 23 pixels then Draws a cyan line from (481, 45) to (438, 231).
; PLAN: r0=246(x), r1=112(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=104(y), r7=48(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x1), r11=45(y1), r12=438(x2), r13=231(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 112
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 104
LDI r7, 48
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 45
LDI r12, 438
LDI r13, 231
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
