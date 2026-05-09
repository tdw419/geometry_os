; DESCRIPTION: Composite: Renders a blue line between points (172, 54) and (86, 127) then Places a blue 79x103 rectangle at position (173, 36) then Renders a white disk with center (378, 61) and radius 15.
; PLAN: r0=172(x1), r1=54(y1), r2=86(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=36(y), r7=79(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=61(y), r12=15(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 54
LDI r2, 86
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 36
LDI r7, 79
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 61
LDI r12, 15
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
