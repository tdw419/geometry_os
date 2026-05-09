; DESCRIPTION: Composite: Places a magenta 102x36 rectangle at position (150, 68) then Draws a magenta circle centered at (309, 226) with radius 19 then Renders a magenta line between points (143, 100) and (90, 177).
; PLAN: r0=150(x), r1=68(y), r2=102(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=226(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x1), r11=100(y1), r12=90(x2), r13=177(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 68
LDI r2, 102
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 226
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 100
LDI r12, 90
LDI r13, 177
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
