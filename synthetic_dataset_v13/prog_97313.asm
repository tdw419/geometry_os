; DESCRIPTION: Composite: Draws a red circle centered at (316, 219) with radius 36 then Renders a white line between points (312, 223) and (395, 182) then Places a yellow 29x120 rectangle at position (280, 28).
; PLAN: r0=316(x), r1=219(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=223(y1), r7=395(x2), r8=182(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=28(y), r12=29(width), r13=120(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 219
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 223
LDI r7, 395
LDI r8, 182
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 28
LDI r12, 29
LDI r13, 120
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
