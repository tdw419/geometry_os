; DESCRIPTION: Composite: Draws a green circle centered at (340, 155) with radius 77 then Sets a single cyan pixel at (395, 63) then Creates a cyan rectangular region at (50, 84) spanning 108 by 21 pixels.
; PLAN: r0=340(x), r1=155(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=50(x), r11=84(y), r12=108(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 155
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 50
LDI r11, 84
LDI r12, 108
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
