; DESCRIPTION: Composite: Places a orange line segment connecting (267, 193) to (306, 16) then Draws a magenta rectangle at (364, 92) with width 109 and height 53 then Places a cyan circle of radius 47 at center (272, 132).
; PLAN: r0=267(x1), r1=193(y1), r2=306(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=92(y), r7=109(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=132(y), r12=47(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 193
LDI r2, 306
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 92
LDI r7, 109
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 132
LDI r12, 47
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
