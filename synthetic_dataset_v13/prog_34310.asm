; DESCRIPTION: Composite: Renders a white disk with center (164, 134) and radius 78 then Renders a yellow line between points (82, 1) and (20, 131) then Creates a green rectangular region at (39, 161) spanning 27 by 17 pixels.
; PLAN: r0=164(x), r1=134(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x1), r6=1(y1), r7=20(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=161(y), r12=27(width), r13=17(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 134
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 1
LDI r7, 20
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 161
LDI r12, 27
LDI r13, 17
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
