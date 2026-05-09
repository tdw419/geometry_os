; DESCRIPTION: Composite: Renders a magenta disk with center (78, 94) and radius 75 then Draws a blue line from (17, 178) to (177, 188) then Places a green 39x92 rectangle at position (171, 54).
; PLAN: r0=78(x), r1=94(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=178(y1), r7=177(x2), r8=188(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=54(y), r12=39(width), r13=92(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 94
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 178
LDI r7, 177
LDI r8, 188
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 54
LDI r12, 39
LDI r13, 92
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
