; DESCRIPTION: Composite: Places a cyan dot at position (476, 159) then Creates a magenta rectangular region at (346, 143) spanning 86 by 75 pixels then Places a yellow line segment connecting (62, 54) to (230, 110).
; PLAN: r0=476(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=143(y), r7=86(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x1), r11=54(y1), r12=230(x2), r13=110(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 143
LDI r7, 86
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 54
LDI r12, 230
LDI r13, 110
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
