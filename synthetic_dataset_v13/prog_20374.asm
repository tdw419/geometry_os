; DESCRIPTION: Composite: Draws a cyan rectangle at (205, 91) with width 48 and height 99 then Creates a cyan circular shape at (225, 161) with radius 73 then Draws a orange line from (320, 96) to (363, 103).
; PLAN: r0=205(x), r1=91(y), r2=48(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=161(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=320(x1), r11=96(y1), r12=363(x2), r13=103(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 91
LDI r2, 48
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 161
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 320
LDI r11, 96
LDI r12, 363
LDI r13, 103
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
