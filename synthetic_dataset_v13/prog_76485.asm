; DESCRIPTION: Composite: Creates a purple circular shape at (422, 150) with radius 21 then Sets a single green pixel at (101, 196) then Draws a magenta rectangle at (272, 125) with width 73 and height 27.
; PLAN: r0=422(x), r1=150(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=196(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=125(y), r12=73(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 150
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 196
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 125
LDI r12, 73
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
