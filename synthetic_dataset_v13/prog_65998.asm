; DESCRIPTION: Composite: Draws a orange rectangle at (420, 163) with width 27 and height 22 then Sets a single blue pixel at (262, 16) then Draws a yellow circle centered at (337, 180) with radius 63.
; PLAN: r0=420(x), r1=163(y), r2=27(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=16(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=180(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 163
LDI r2, 27
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 16
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 180
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
