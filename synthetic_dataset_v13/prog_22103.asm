; DESCRIPTION: Composite: Sets a single blue pixel at (294, 20) then Places a orange line segment connecting (128, 6) to (331, 133) then Draws a magenta rectangle at (98, 48) with width 61 and height 42.
; PLAN: r0=294(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=128(x1), r6=6(y1), r7=331(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=48(y), r12=61(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 6
LDI r7, 331
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 48
LDI r12, 61
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
