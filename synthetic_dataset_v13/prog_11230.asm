; DESCRIPTION: Composite: Draws a white line from (23, 190) to (105, 219) then Draws a green rectangle at (57, 28) with width 110 and height 114 then Places a green circle of radius 28 at center (65, 146).
; PLAN: r0=23(x1), r1=190(y1), r2=105(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=28(y), r7=110(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x), r11=146(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 190
LDI r2, 105
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 28
LDI r7, 110
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 146
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
