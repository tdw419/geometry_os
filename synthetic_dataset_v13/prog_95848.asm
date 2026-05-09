; DESCRIPTION: Composite: Places a purple line segment connecting (330, 110) to (143, 25) then Renders a orange disk with center (281, 56) and radius 18 then Renders a cyan box of size 25x46 starting at (359, 94).
; PLAN: r0=330(x1), r1=110(y1), r2=143(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=56(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=94(y), r12=25(width), r13=46(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 110
LDI r2, 143
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 56
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 94
LDI r12, 25
LDI r13, 46
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
