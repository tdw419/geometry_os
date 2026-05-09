; DESCRIPTION: Composite: Places a yellow dot at position (241, 172) then Places a black line segment connecting (502, 19) to (65, 183) then Places a green 74x23 rectangle at position (396, 233).
; PLAN: r0=241(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=19(y1), r7=65(x2), r8=183(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=233(y), r12=74(width), r13=23(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 502
LDI r6, 19
LDI r7, 65
LDI r8, 183
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 233
LDI r12, 74
LDI r13, 23
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
