; DESCRIPTION: Composite: Renders a blue disk with center (226, 149) and radius 78 then Renders a cyan line between points (346, 145) and (398, 179) then Draws a purple rectangle at (251, 107) with width 78 and height 87.
; PLAN: r0=226(x), r1=149(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=145(y1), r7=398(x2), r8=179(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=107(y), r12=78(width), r13=87(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 149
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 145
LDI r7, 398
LDI r8, 179
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 107
LDI r12, 78
LDI r13, 87
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
