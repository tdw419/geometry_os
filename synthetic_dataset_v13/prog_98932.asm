; DESCRIPTION: Composite: Draws a white circle centered at (240, 207) with radius 21 then Renders a white box of size 108x63 starting at (63, 50) then Sets a single white pixel at (256, 78).
; PLAN: r0=240(x), r1=207(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=50(y), r7=108(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=78(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 207
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 50
LDI r7, 108
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 78
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
