; DESCRIPTION: Composite: Places a red 75x95 rectangle at position (85, 129) then Draws a red circle centered at (435, 148) with radius 23 then Places a black line segment connecting (75, 243) to (227, 220).
; PLAN: r0=85(x), r1=129(y), r2=75(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=148(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x1), r11=243(y1), r12=227(x2), r13=220(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 129
LDI r2, 75
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 148
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 243
LDI r12, 227
LDI r13, 220
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
