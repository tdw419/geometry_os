; DESCRIPTION: Composite: Renders a black line between points (174, 214) and (154, 127) then Places a red dot at position (273, 247) then Draws a blue rectangle at (38, 174) with width 109 and height 80.
; PLAN: r0=174(x1), r1=214(y1), r2=154(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=247(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=174(y), r12=109(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 214
LDI r2, 154
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 247
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 38
LDI r11, 174
LDI r12, 109
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
