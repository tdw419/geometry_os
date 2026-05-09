; DESCRIPTION: Composite: Places a magenta circle of radius 21 at center (156, 97) then Creates a red rectangular region at (192, 129) spanning 60 by 76 pixels then Draws a white line from (393, 117) to (127, 170).
; PLAN: r0=156(x), r1=97(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=129(y), r7=60(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x1), r11=117(y1), r12=127(x2), r13=170(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 97
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 129
LDI r7, 60
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 117
LDI r12, 127
LDI r13, 170
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
