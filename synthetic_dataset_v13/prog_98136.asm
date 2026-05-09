; DESCRIPTION: Composite: Draws a green rectangle at (284, 77) with width 82 and height 118 then Sets a single blue pixel at (509, 70) then Renders a yellow line between points (94, 7) and (503, 81).
; PLAN: r0=284(x), r1=77(y), r2=82(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=7(y1), r12=503(x2), r13=81(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 77
LDI r2, 82
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 7
LDI r12, 503
LDI r13, 81
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
