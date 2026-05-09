; DESCRIPTION: Composite: Draws a green rectangle at (369, 179) with width 14 and height 28 then Sets a single cyan pixel at (38, 118) then Draws a blue circle centered at (190, 39) with radius 22.
; PLAN: r0=369(x), r1=179(y), r2=14(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=118(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=190(x), r11=39(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 179
LDI r2, 14
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 118
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 190
LDI r11, 39
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
