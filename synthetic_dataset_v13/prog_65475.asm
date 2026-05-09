; DESCRIPTION: Composite: Renders a white line between points (213, 23) and (459, 205) then Draws a purple rectangle at (480, 135) with width 14 and height 109 then Renders a green disk with center (405, 125) and radius 79.
; PLAN: r0=213(x1), r1=23(y1), r2=459(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=135(y), r7=14(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=125(y), r12=79(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 23
LDI r2, 459
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 135
LDI r7, 14
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 125
LDI r12, 79
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
