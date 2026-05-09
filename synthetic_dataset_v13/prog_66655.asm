; DESCRIPTION: Composite: Places a green 55x12 rectangle at position (268, 126) then Places a blue dot at position (90, 237) then Renders a yellow line between points (233, 113) and (412, 194).
; PLAN: r0=268(x), r1=126(y), r2=55(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=233(x1), r11=113(y1), r12=412(x2), r13=194(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 126
LDI r2, 55
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 113
LDI r12, 412
LDI r13, 194
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
