; DESCRIPTION: Composite: Draws a purple line from (287, 151) to (256, 177) then Draws a magenta rectangle at (410, 175) with width 61 and height 36 then Places a cyan circle of radius 65 at center (270, 149).
; PLAN: r0=287(x1), r1=151(y1), r2=256(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=175(y), r7=61(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=149(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 151
LDI r2, 256
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 175
LDI r7, 61
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 149
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
