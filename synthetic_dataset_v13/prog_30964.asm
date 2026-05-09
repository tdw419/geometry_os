; DESCRIPTION: Composite: Sets a single red pixel at (217, 233) then Draws a red rectangle at (60, 174) with width 98 and height 78 then Renders a white line between points (396, 128) and (426, 9).
; PLAN: r0=217(x), r1=233(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=174(y), r7=98(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x1), r11=128(y1), r12=426(x2), r13=9(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 233
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 60
LDI r6, 174
LDI r7, 98
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 128
LDI r12, 426
LDI r13, 9
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
