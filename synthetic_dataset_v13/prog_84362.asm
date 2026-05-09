; DESCRIPTION: Composite: Draws a magenta line from (249, 115) to (468, 113) then Creates a red circular shape at (181, 104) with radius 76 then Creates a cyan rectangular region at (184, 213) spanning 14 by 31 pixels.
; PLAN: r0=249(x1), r1=115(y1), r2=468(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=104(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=184(x), r11=213(y), r12=14(width), r13=31(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 115
LDI r2, 468
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 104
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 184
LDI r11, 213
LDI r12, 14
LDI r13, 31
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
