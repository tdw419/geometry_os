; DESCRIPTION: Composite: Places a blue 57x99 rectangle at position (350, 88) then Sets a single magenta pixel at (467, 154) then Places a red circle of radius 57 at center (137, 58).
; PLAN: r0=350(x), r1=88(y), r2=57(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=154(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=58(y), r12=57(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 350
LDI r1, 88
LDI r2, 57
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 154
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 137
LDI r11, 58
LDI r12, 57
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
