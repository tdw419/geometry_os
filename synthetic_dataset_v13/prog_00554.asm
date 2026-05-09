; DESCRIPTION: Composite: Renders a yellow disk with center (115, 214) and radius 37 then Places a green 95x93 rectangle at position (184, 16) then Draws a purple line from (127, 124) to (67, 69).
; PLAN: r0=115(x), r1=214(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=16(y), r7=95(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=124(y1), r12=67(x2), r13=69(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 214
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 16
LDI r7, 95
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 124
LDI r12, 67
LDI r13, 69
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
