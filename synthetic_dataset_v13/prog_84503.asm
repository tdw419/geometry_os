; DESCRIPTION: Composite: Sets a single orange pixel at (309, 88) then Creates a orange circular shape at (397, 208) with radius 24 then Renders a green line between points (416, 134) and (486, 174).
; PLAN: r0=309(x), r1=88(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=208(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x1), r11=134(y1), r12=486(x2), r13=174(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 88
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 397
LDI r6, 208
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 134
LDI r12, 486
LDI r13, 174
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
