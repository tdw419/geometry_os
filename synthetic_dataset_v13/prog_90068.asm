; DESCRIPTION: Composite: Renders a magenta box of size 13x106 starting at (331, 7) then Places a green dot at position (383, 240) then Places a black circle of radius 60 at center (440, 83).
; PLAN: r0=331(x), r1=7(y), r2=13(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=240(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=440(x), r11=83(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 7
LDI r2, 13
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 240
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 440
LDI r11, 83
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
