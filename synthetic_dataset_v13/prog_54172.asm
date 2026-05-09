; DESCRIPTION: Composite: Draws a orange line from (87, 164) to (334, 241) then Places a cyan circle of radius 60 at center (279, 74) then Creates a cyan rectangular region at (408, 8) spanning 64 by 60 pixels.
; PLAN: r0=87(x1), r1=164(y1), r2=334(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=74(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x), r11=8(y), r12=64(width), r13=60(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 164
LDI r2, 334
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 74
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 8
LDI r12, 64
LDI r13, 60
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
