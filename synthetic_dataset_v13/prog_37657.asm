; DESCRIPTION: Composite: Draws a white circle centered at (439, 164) with radius 50 then Places a orange dot at position (345, 255) then Renders a purple line between points (186, 101) and (224, 164).
; PLAN: r0=439(x), r1=164(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=186(x1), r11=101(y1), r12=224(x2), r13=164(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 164
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 186
LDI r11, 101
LDI r12, 224
LDI r13, 164
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
