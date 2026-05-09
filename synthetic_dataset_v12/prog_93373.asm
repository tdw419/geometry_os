; DESCRIPTION: Composite: Draws a blue line from (208, 204) to (497, 116) then Places a green 99x120 rectangle at position (126, 18) then Places a magenta circle of radius 68 at center (439, 121).
; PLAN: r0=208(x1), r1=204(y1), r2=497(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=18(y), r7=99(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=121(y), r12=68(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 204
LDI r2, 497
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 18
LDI r7, 99
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 121
LDI r12, 68
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
