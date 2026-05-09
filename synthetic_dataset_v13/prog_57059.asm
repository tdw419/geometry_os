; DESCRIPTION: Composite: Renders a yellow box of size 99x60 starting at (219, 82) then Draws a yellow circle centered at (320, 208) with radius 36 then Sets a single black pixel at (118, 110).
; PLAN: r0=219(x), r1=82(y), r2=99(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=208(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=110(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 82
LDI r2, 99
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 208
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 110
LDI r12, 0x000000
PSET r10, r11, r12
HALT
