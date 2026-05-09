; DESCRIPTION: Composite: Creates a purple rectangular region at (127, 200) spanning 32 by 50 pixels then Places a red dot at position (457, 25) then Creates a magenta circular shape at (198, 111) with radius 14.
; PLAN: r0=127(x), r1=200(y), r2=32(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=25(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=111(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 200
LDI r2, 32
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 25
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 198
LDI r11, 111
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
