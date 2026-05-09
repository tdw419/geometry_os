; DESCRIPTION: Composite: Renders a yellow disk with center (319, 126) and radius 50 then Draws a yellow line from (412, 201) to (114, 77) then Places a purple 108x63 rectangle at position (11, 152).
; PLAN: r0=319(x), r1=126(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=201(y1), r7=114(x2), r8=77(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=152(y), r12=108(width), r13=63(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 126
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 201
LDI r7, 114
LDI r8, 77
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 152
LDI r12, 108
LDI r13, 63
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
