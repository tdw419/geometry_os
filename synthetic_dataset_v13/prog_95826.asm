; DESCRIPTION: Composite: Renders a white disk with center (33, 200) and radius 18 then Renders a yellow line between points (101, 77) and (115, 68) then Places a blue 57x66 rectangle at position (435, 58).
; PLAN: r0=33(x), r1=200(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x1), r6=77(y1), r7=115(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=58(y), r12=57(width), r13=66(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 200
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 77
LDI r7, 115
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 58
LDI r12, 57
LDI r13, 66
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
