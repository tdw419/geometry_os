; DESCRIPTION: Composite: Draws a purple rectangle at (356, 198) with width 104 and height 58 then Places a yellow circle of radius 68 at center (294, 96) then Renders a white line between points (402, 228) and (182, 57).
; PLAN: r0=356(x), r1=198(y), r2=104(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=96(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x1), r11=228(y1), r12=182(x2), r13=57(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 198
LDI r2, 104
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 96
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 228
LDI r12, 182
LDI r13, 57
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
