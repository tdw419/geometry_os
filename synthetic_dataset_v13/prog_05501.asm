; DESCRIPTION: Composite: Draws a magenta rectangle at (146, 112) with width 28 and height 94 then Draws a blue line from (305, 18) to (431, 45) then Draws a cyan circle centered at (390, 125) with radius 77.
; PLAN: r0=146(x), r1=112(y), r2=28(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x1), r6=18(y1), r7=431(x2), r8=45(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=125(y), r12=77(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 112
LDI r2, 28
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 18
LDI r7, 431
LDI r8, 45
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 125
LDI r12, 77
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
