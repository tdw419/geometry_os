; DESCRIPTION: Composite: Renders a red box of size 85x20 starting at (218, 100) then Draws a purple circle centered at (318, 150) with radius 60 then Sets a single cyan pixel at (367, 126).
; PLAN: r0=218(x), r1=100(y), r2=85(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=150(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=126(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 100
LDI r2, 85
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 150
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 126
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
