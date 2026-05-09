; DESCRIPTION: Composite: Draws a orange circle centered at (387, 98) with radius 44 then Renders a white line between points (62, 40) and (239, 162) then Renders a blue box of size 86x115 starting at (330, 29).
; PLAN: r0=387(x), r1=98(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=40(y1), r7=239(x2), r8=162(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=29(y), r12=86(width), r13=115(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 98
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 40
LDI r7, 239
LDI r8, 162
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 29
LDI r12, 86
LDI r13, 115
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
