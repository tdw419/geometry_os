; DESCRIPTION: Composite: Creates a cyan rectangular region at (435, 105) spanning 31 by 101 pixels then Draws a white circle centered at (191, 107) with radius 31 then Renders a white line between points (237, 239) and (380, 168).
; PLAN: r0=435(x), r1=105(y), r2=31(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=107(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x1), r11=239(y1), r12=380(x2), r13=168(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 105
LDI r2, 31
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 107
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 239
LDI r12, 380
LDI r13, 168
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
