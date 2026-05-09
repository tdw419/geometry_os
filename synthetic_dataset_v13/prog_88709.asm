; DESCRIPTION: Composite: Places a cyan dot at position (407, 144) then Draws a orange circle centered at (239, 175) with radius 70 then Places a purple line segment connecting (462, 228) to (293, 227).
; PLAN: r0=407(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=175(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=228(y1), r12=293(x2), r13=227(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 175
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 228
LDI r12, 293
LDI r13, 227
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
