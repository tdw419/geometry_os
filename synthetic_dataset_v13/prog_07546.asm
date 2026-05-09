; DESCRIPTION: Composite: Sets a single green pixel at (196, 24) then Renders a red line between points (224, 179) and (325, 60) then Draws a white rectangle at (286, 135) with width 12 and height 89.
; PLAN: r0=196(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=224(x1), r6=179(y1), r7=325(x2), r8=60(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=135(y), r12=12(width), r13=89(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 24
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 224
LDI r6, 179
LDI r7, 325
LDI r8, 60
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 135
LDI r12, 12
LDI r13, 89
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
