; DESCRIPTION: Composite: Renders a black box of size 30x39 starting at (439, 150) then Draws a green circle centered at (385, 62) with radius 32 then Sets a single orange pixel at (486, 50).
; PLAN: r0=439(x), r1=150(y), r2=30(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=62(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=50(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 150
LDI r2, 30
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 62
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 50
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
