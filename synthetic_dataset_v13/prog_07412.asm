; DESCRIPTION: Composite: Renders a magenta box of size 78x52 starting at (188, 192) then Places a blue dot at position (481, 55) then Draws a white line from (421, 151) to (124, 120).
; PLAN: r0=188(x), r1=192(y), r2=78(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=55(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=421(x1), r11=151(y1), r12=124(x2), r13=120(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 192
LDI r2, 78
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 55
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 151
LDI r12, 124
LDI r13, 120
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
