; DESCRIPTION: Composite: Places a black 108x81 rectangle at position (285, 110) then Places a orange circle of radius 57 at center (129, 197) then Renders a green line between points (434, 24) and (251, 64).
; PLAN: r0=285(x), r1=110(y), r2=108(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=197(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x1), r11=24(y1), r12=251(x2), r13=64(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 110
LDI r2, 108
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 197
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 24
LDI r12, 251
LDI r13, 64
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
