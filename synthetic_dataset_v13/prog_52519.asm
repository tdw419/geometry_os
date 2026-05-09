; DESCRIPTION: Composite: Places a yellow 116x37 rectangle at position (392, 211) then Draws a cyan circle centered at (262, 195) with radius 52 then Renders a yellow line between points (291, 26) and (274, 141).
; PLAN: r0=392(x), r1=211(y), r2=116(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=195(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x1), r11=26(y1), r12=274(x2), r13=141(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 211
LDI r2, 116
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 195
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 26
LDI r12, 274
LDI r13, 141
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
