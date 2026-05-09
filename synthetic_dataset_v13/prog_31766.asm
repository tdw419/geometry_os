; DESCRIPTION: Composite: Places a magenta dot at position (330, 174) then Places a purple 117x95 rectangle at position (371, 147) then Draws a white circle centered at (75, 156) with radius 48.
; PLAN: r0=330(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=147(y), r7=117(width), r8=95(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=156(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 147
LDI r7, 117
LDI r8, 95
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 156
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
