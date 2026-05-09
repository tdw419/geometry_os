; DESCRIPTION: Composite: Renders a white line between points (241, 62) and (254, 80) then Places a blue dot at position (285, 73) then Places a magenta 86x112 rectangle at position (47, 112).
; PLAN: r0=241(x1), r1=62(y1), r2=254(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=112(y), r12=86(width), r13=112(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 62
LDI r2, 254
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 47
LDI r11, 112
LDI r12, 86
LDI r13, 112
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
