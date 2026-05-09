; DESCRIPTION: Composite: Draws a white rectangle at (253, 48) with width 61 and height 75 then Draws a cyan circle centered at (337, 92) with radius 79 then Places a white line segment connecting (189, 6) to (404, 6).
; PLAN: r0=253(x), r1=48(y), r2=61(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=92(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x1), r11=6(y1), r12=404(x2), r13=6(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 48
LDI r2, 61
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 92
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 6
LDI r12, 404
LDI r13, 6
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
