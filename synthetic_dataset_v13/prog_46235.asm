; DESCRIPTION: Composite: Places a yellow dot at position (503, 152) then Draws a green rectangle at (164, 105) with width 72 and height 94 then Places a purple line segment connecting (110, 85) to (256, 243).
; PLAN: r0=503(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=105(y), r7=72(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x1), r11=85(y1), r12=256(x2), r13=243(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 105
LDI r7, 72
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 85
LDI r12, 256
LDI r13, 243
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
