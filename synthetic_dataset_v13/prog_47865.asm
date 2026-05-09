; DESCRIPTION: Composite: Places a magenta circle of radius 44 at center (405, 167) then Draws a yellow line from (221, 186) to (351, 151) then Renders a magenta box of size 84x99 starting at (51, 129).
; PLAN: r0=405(x), r1=167(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=186(y1), r7=351(x2), r8=151(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=129(y), r12=84(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 167
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 186
LDI r7, 351
LDI r8, 151
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 129
LDI r12, 84
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
