; DESCRIPTION: Composite: Places a blue 86x48 rectangle at position (243, 65) then Sets a single red pixel at (240, 65) then Draws a purple circle centered at (399, 94) with radius 61.
; PLAN: r0=243(x), r1=65(y), r2=86(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=65(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=94(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 65
LDI r2, 86
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 65
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 399
LDI r11, 94
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
