; DESCRIPTION: Composite: Creates a orange rectangular region at (369, 57) spanning 92 by 68 pixels then Draws a purple circle centered at (307, 162) with radius 55 then Places a yellow dot at position (160, 212).
; PLAN: r0=369(x), r1=57(y), r2=92(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=162(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=212(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 57
LDI r2, 92
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 162
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 212
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
