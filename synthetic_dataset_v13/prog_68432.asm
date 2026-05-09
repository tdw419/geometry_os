; DESCRIPTION: Composite: Sets a single orange pixel at (277, 150) then Places a orange line segment connecting (93, 255) to (234, 224) then Places a white 52x74 rectangle at position (126, 129).
; PLAN: r0=277(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=255(y1), r7=234(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=129(y), r12=52(width), r13=74(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 93
LDI r6, 255
LDI r7, 234
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 129
LDI r12, 52
LDI r13, 74
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
