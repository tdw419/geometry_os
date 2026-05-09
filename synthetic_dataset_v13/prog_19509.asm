; DESCRIPTION: Composite: Places a green 16x52 rectangle at position (337, 116) then Places a blue dot at position (396, 174) then Creates a blue circular shape at (262, 46) with radius 10.
; PLAN: r0=337(x), r1=116(y), r2=16(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=174(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=262(x), r11=46(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 116
LDI r2, 16
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 174
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 262
LDI r11, 46
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
