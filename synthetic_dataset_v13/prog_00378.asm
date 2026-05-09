; DESCRIPTION: Composite: Places a yellow line segment connecting (391, 175) to (497, 224) then Renders a white disk with center (383, 81) and radius 49 then Places a yellow 34x50 rectangle at position (251, 32).
; PLAN: r0=391(x1), r1=175(y1), r2=497(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=81(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=32(y), r12=34(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 175
LDI r2, 497
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 81
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 32
LDI r12, 34
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
