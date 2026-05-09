; DESCRIPTION: Composite: Draws a yellow circle centered at (54, 151) with radius 43 then Draws a black line from (307, 103) to (458, 108) then Creates a cyan rectangular region at (334, 157) spanning 16 by 96 pixels.
; PLAN: r0=54(x), r1=151(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=103(y1), r7=458(x2), r8=108(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=157(y), r12=16(width), r13=96(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 151
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 103
LDI r7, 458
LDI r8, 108
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 157
LDI r12, 16
LDI r13, 96
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
