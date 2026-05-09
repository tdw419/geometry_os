; DESCRIPTION: Composite: Places a red 99x91 rectangle at position (246, 124) then Places a blue dot at position (344, 73) then Draws a magenta circle centered at (465, 46) with radius 25.
; PLAN: r0=246(x), r1=124(y), r2=99(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=465(x), r11=46(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 124
LDI r2, 99
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 465
LDI r11, 46
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
