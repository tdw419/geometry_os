; DESCRIPTION: Composite: Creates a purple rectangular region at (66, 111) spanning 69 by 71 pixels then Sets a single black pixel at (123, 232) then Draws a yellow circle centered at (198, 129) with radius 57.
; PLAN: r0=66(x), r1=111(y), r2=69(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=232(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=129(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 111
LDI r2, 69
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 232
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 198
LDI r11, 129
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
