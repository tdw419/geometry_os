; DESCRIPTION: Composite: Draws a white circle centered at (71, 219) with radius 30 then Draws a yellow line from (487, 109) to (170, 239) then Places a green 38x42 rectangle at position (408, 70).
; PLAN: r0=71(x), r1=219(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=109(y1), r7=170(x2), r8=239(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=70(y), r12=38(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 219
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 109
LDI r7, 170
LDI r8, 239
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 70
LDI r12, 38
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
