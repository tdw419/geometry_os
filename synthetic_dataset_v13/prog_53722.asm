; DESCRIPTION: Composite: Sets a single magenta pixel at (125, 127) then Places a blue 28x26 rectangle at position (405, 114) then Places a yellow circle of radius 54 at center (314, 119).
; PLAN: r0=125(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=114(y), r7=28(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x), r11=119(y), r12=54(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 114
LDI r7, 28
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 119
LDI r12, 54
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
