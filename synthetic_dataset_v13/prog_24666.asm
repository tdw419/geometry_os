; DESCRIPTION: Composite: Renders a cyan disk with center (136, 128) and radius 71 then Renders a yellow line between points (239, 193) and (145, 161) then Creates a orange rectangular region at (272, 188) spanning 37 by 53 pixels.
; PLAN: r0=136(x), r1=128(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x1), r6=193(y1), r7=145(x2), r8=161(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=188(y), r12=37(width), r13=53(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 128
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 193
LDI r7, 145
LDI r8, 161
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 188
LDI r12, 37
LDI r13, 53
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
