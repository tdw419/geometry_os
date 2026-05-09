; DESCRIPTION: Composite: Creates a purple rectangular region at (307, 44) spanning 117 by 99 pixels then Places a green dot at position (146, 89) then Draws a orange circle centered at (101, 141) with radius 52.
; PLAN: r0=307(x), r1=44(y), r2=117(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=146(x), r6=89(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=141(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 44
LDI r2, 117
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 89
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 101
LDI r11, 141
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
