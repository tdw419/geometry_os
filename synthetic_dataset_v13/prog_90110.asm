; DESCRIPTION: Composite: Creates a white rectangular region at (264, 110) spanning 80 by 99 pixels then Places a yellow dot at position (99, 134) then Renders a magenta line between points (239, 94) and (233, 200).
; PLAN: r0=264(x), r1=110(y), r2=80(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=134(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=239(x1), r11=94(y1), r12=233(x2), r13=200(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 110
LDI r2, 80
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 134
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 239
LDI r11, 94
LDI r12, 233
LDI r13, 200
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
