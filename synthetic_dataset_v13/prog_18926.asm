; DESCRIPTION: Composite: Creates a black rectangular region at (220, 81) spanning 107 by 67 pixels then Draws a green circle centered at (391, 37) with radius 22 then Places a green line segment connecting (293, 235) to (300, 126).
; PLAN: r0=220(x), r1=81(y), r2=107(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=37(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x1), r11=235(y1), r12=300(x2), r13=126(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 81
LDI r2, 107
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 37
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 235
LDI r12, 300
LDI r13, 126
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
