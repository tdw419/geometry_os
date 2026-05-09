; DESCRIPTION: Composite: Draws a yellow rectangle at (226, 103) with width 117 and height 90 then Renders a magenta line between points (70, 164) and (146, 75) then Creates a blue circular shape at (60, 193) with radius 52.
; PLAN: r0=226(x), r1=103(y), r2=117(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=164(y1), r7=146(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=193(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 103
LDI r2, 117
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 164
LDI r7, 146
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 193
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
