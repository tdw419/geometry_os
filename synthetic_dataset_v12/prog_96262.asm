; DESCRIPTION: Composite: Draws a black line from (393, 194) to (316, 228) then Places a magenta 109x45 rectangle at position (301, 0) then Places a magenta circle of radius 37 at center (84, 148).
; PLAN: r0=393(x1), r1=194(y1), r2=316(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=0(y), r7=109(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=148(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 194
LDI r2, 316
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 0
LDI r7, 109
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 148
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
