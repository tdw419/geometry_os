; DESCRIPTION: Composite: Renders a blue disk with center (95, 145) and radius 59 then Sets a single green pixel at (70, 117) then Places a yellow 20x40 rectangle at position (57, 157).
; PLAN: r0=95(x), r1=145(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=117(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=157(y), r12=20(width), r13=40(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 145
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 117
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 57
LDI r11, 157
LDI r12, 20
LDI r13, 40
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
