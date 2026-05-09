; DESCRIPTION: Composite: Sets a single black pixel at (491, 213) then Renders a magenta disk with center (79, 180) and radius 75 then Places a white line segment connecting (371, 211) to (183, 2).
; PLAN: r0=491(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=180(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x1), r11=211(y1), r12=183(x2), r13=2(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 79
LDI r6, 180
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 211
LDI r12, 183
LDI r13, 2
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
