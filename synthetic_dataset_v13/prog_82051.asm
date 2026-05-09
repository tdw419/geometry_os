; DESCRIPTION: Composite: Places a red 75x32 rectangle at position (42, 153) then Renders a blue disk with center (318, 58) and radius 56 then Draws a black line from (221, 214) to (500, 83).
; PLAN: r0=42(x), r1=153(y), r2=75(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=58(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x1), r11=214(y1), r12=500(x2), r13=83(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 153
LDI r2, 75
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 58
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 214
LDI r12, 500
LDI r13, 83
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
