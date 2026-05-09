; DESCRIPTION: Composite: Draws a red rectangle at (453, 184) with width 10 and height 16 then Places a blue dot at position (129, 59) then Places a white line segment connecting (220, 65) to (507, 172).
; PLAN: r0=453(x), r1=184(y), r2=10(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=220(x1), r11=65(y1), r12=507(x2), r13=172(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 184
LDI r2, 10
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 65
LDI r12, 507
LDI r13, 172
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
