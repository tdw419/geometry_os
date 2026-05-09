; DESCRIPTION: Composite: Creates a purple circular shape at (405, 198) with radius 21 then Places a purple 17x48 rectangle at position (165, 64) then Renders a white line between points (54, 75) and (500, 219).
; PLAN: r0=405(x), r1=198(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=64(y), r7=17(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=75(y1), r12=500(x2), r13=219(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 198
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 64
LDI r7, 17
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 75
LDI r12, 500
LDI r13, 219
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
