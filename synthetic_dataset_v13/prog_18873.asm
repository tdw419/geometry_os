; DESCRIPTION: Composite: Creates a yellow rectangular region at (73, 98) spanning 78 by 76 pixels then Draws a yellow line from (140, 202) to (386, 192) then Places a magenta circle of radius 17 at center (178, 51).
; PLAN: r0=73(x), r1=98(y), r2=78(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=202(y1), r7=386(x2), r8=192(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=51(y), r12=17(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 98
LDI r2, 78
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 202
LDI r7, 386
LDI r8, 192
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 51
LDI r12, 17
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
