; DESCRIPTION: Composite: Renders a yellow line between points (235, 41) and (338, 3) then Renders a orange disk with center (454, 152) and radius 17 then Creates a cyan rectangular region at (440, 15) spanning 52 by 82 pixels.
; PLAN: r0=235(x1), r1=41(y1), r2=338(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=152(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=15(y), r12=52(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 41
LDI r2, 338
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 152
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 15
LDI r12, 52
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
