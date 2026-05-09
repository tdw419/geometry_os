; DESCRIPTION: Composite: Draws a white circle centered at (224, 121) with radius 27 then Sets a single green pixel at (185, 21) then Places a black line segment connecting (436, 239) to (437, 24).
; PLAN: r0=224(x), r1=121(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=21(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=436(x1), r11=239(y1), r12=437(x2), r13=24(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 121
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 21
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 436
LDI r11, 239
LDI r12, 437
LDI r13, 24
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
