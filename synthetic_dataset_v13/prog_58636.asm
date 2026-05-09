; DESCRIPTION: Composite: Draws a magenta circle centered at (270, 62) with radius 35 then Sets a single cyan pixel at (198, 25) then Places a blue 44x65 rectangle at position (17, 111).
; PLAN: r0=270(x), r1=62(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=25(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=111(y), r12=44(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 62
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 25
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 111
LDI r12, 44
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
