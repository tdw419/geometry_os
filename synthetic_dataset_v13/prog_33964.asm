; DESCRIPTION: Composite: Sets a single black pixel at (384, 152) then Creates a green rectangular region at (131, 129) spanning 75 by 15 pixels then Creates a purple circular shape at (362, 125) with radius 30.
; PLAN: r0=384(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=129(y), r7=75(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=362(x), r11=125(y), r12=30(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 131
LDI r6, 129
LDI r7, 75
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 125
LDI r12, 30
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
