; DESCRIPTION: Composite: Places a red 29x29 rectangle at position (422, 109) then Renders a green disk with center (377, 40) and radius 17 then Renders a white line between points (301, 125) and (23, 70).
; PLAN: r0=422(x), r1=109(y), r2=29(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=40(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x1), r11=125(y1), r12=23(x2), r13=70(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 109
LDI r2, 29
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 40
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 125
LDI r12, 23
LDI r13, 70
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
