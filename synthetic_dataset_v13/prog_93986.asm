; DESCRIPTION: Composite: Draws a magenta rectangle at (375, 85) with width 106 and height 84 then Draws a yellow line from (410, 39) to (18, 221) then Creates a cyan circular shape at (412, 51) with radius 50.
; PLAN: r0=375(x), r1=85(y), r2=106(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=39(y1), r7=18(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=51(y), r12=50(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 85
LDI r2, 106
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 39
LDI r7, 18
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 51
LDI r12, 50
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
