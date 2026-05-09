; DESCRIPTION: Composite: Sets a single white pixel at (115, 147) then Draws a blue rectangle at (280, 61) with width 85 and height 27 then Places a yellow line segment connecting (26, 33) to (276, 60).
; PLAN: r0=115(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=61(y), r7=85(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x1), r11=33(y1), r12=276(x2), r13=60(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 61
LDI r7, 85
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 33
LDI r12, 276
LDI r13, 60
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
