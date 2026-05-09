; DESCRIPTION: Composite: Places a black circle of radius 27 at center (123, 37) then Places a red 100x113 rectangle at position (165, 106) then Renders a white line between points (245, 127) and (264, 167).
; PLAN: r0=123(x), r1=37(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=106(y), r7=100(width), r8=113(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x1), r11=127(y1), r12=264(x2), r13=167(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 37
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 106
LDI r7, 100
LDI r8, 113
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 127
LDI r12, 264
LDI r13, 167
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
