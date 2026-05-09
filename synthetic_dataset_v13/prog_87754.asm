; DESCRIPTION: Composite: Renders a blue disk with center (409, 114) and radius 42 then Draws a cyan line from (52, 39) to (237, 136) then Draws a blue rectangle at (10, 206) with width 69 and height 20.
; PLAN: r0=409(x), r1=114(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x1), r6=39(y1), r7=237(x2), r8=136(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=206(y), r12=69(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 114
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 39
LDI r7, 237
LDI r8, 136
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 206
LDI r12, 69
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
