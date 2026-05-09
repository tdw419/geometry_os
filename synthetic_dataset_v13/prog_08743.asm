; DESCRIPTION: Composite: Renders a green disk with center (338, 172) and radius 61 then Renders a cyan line between points (232, 165) and (409, 171) then Creates a white rectangular region at (138, 221) spanning 65 by 28 pixels.
; PLAN: r0=338(x), r1=172(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=165(y1), r7=409(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=221(y), r12=65(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 172
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 165
LDI r7, 409
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 221
LDI r12, 65
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
