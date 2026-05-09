; DESCRIPTION: Composite: Places a magenta dot at position (326, 95) then Creates a magenta circular shape at (126, 74) with radius 46 then Places a white line segment connecting (155, 224) to (281, 12).
; PLAN: r0=326(x), r1=95(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=74(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x1), r11=224(y1), r12=281(x2), r13=12(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 95
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 74
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 224
LDI r12, 281
LDI r13, 12
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
