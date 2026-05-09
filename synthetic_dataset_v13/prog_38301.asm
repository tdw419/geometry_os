; DESCRIPTION: Composite: Draws a blue circle centered at (124, 171) with radius 45 then Renders a white line between points (223, 192) and (295, 91) then Places a black 36x18 rectangle at position (51, 186).
; PLAN: r0=124(x), r1=171(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=192(y1), r7=295(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=186(y), r12=36(width), r13=18(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 171
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 192
LDI r7, 295
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 186
LDI r12, 36
LDI r13, 18
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
