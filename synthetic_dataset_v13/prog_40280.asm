; DESCRIPTION: Composite: Renders a yellow disk with center (166, 133) and radius 79 then Draws a magenta line from (262, 60) to (160, 62) then Places a white 68x29 rectangle at position (65, 112).
; PLAN: r0=166(x), r1=133(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=60(y1), r7=160(x2), r8=62(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=112(y), r12=68(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 133
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 60
LDI r7, 160
LDI r8, 62
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 112
LDI r12, 68
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
