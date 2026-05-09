; DESCRIPTION: Composite: Draws a orange rectangle at (383, 36) with width 100 and height 64 then Renders a blue line between points (500, 238) and (493, 100) then Draws a magenta circle centered at (228, 96) with radius 60.
; PLAN: r0=383(x), r1=36(y), r2=100(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=500(x1), r6=238(y1), r7=493(x2), r8=100(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=96(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 36
LDI r2, 100
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 238
LDI r7, 493
LDI r8, 100
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 96
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
