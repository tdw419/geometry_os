; DESCRIPTION: Composite: Places a white line segment connecting (193, 99) to (60, 243) then Draws a yellow rectangle at (415, 94) with width 90 and height 33 then Places a magenta circle of radius 19 at center (265, 192).
; PLAN: r0=193(x1), r1=99(y1), r2=60(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=94(y), r7=90(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=192(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 99
LDI r2, 60
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 94
LDI r7, 90
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 192
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
