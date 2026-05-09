; DESCRIPTION: Composite: Renders a magenta box of size 86x17 starting at (87, 199) then Draws a purple circle centered at (256, 99) with radius 47 then Renders a cyan line between points (75, 196) and (39, 184).
; PLAN: r0=87(x), r1=199(y), r2=86(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=99(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x1), r11=196(y1), r12=39(x2), r13=184(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 199
LDI r2, 86
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 99
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 196
LDI r12, 39
LDI r13, 184
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
