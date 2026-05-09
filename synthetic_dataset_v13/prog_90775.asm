; DESCRIPTION: Composite: Creates a orange circular shape at (262, 217) with radius 37 then Draws a white line from (18, 0) to (273, 58) then Renders a black box of size 36x60 starting at (340, 181).
; PLAN: r0=262(x), r1=217(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=0(y1), r7=273(x2), r8=58(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=181(y), r12=36(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 217
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 0
LDI r7, 273
LDI r8, 58
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 181
LDI r12, 36
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
