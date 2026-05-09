; DESCRIPTION: Composite: Places a magenta 115x110 rectangle at position (268, 65) then Draws a orange line from (394, 154) to (125, 185) then Renders a yellow disk with center (181, 129) and radius 39.
; PLAN: r0=268(x), r1=65(y), r2=115(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=154(y1), r7=125(x2), r8=185(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=181(x), r11=129(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 65
LDI r2, 115
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 154
LDI r7, 125
LDI r8, 185
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 129
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
