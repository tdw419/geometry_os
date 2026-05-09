; DESCRIPTION: Composite: Places a magenta line segment connecting (125, 138) to (478, 88) then Sets a single cyan pixel at (102, 118) then Places a yellow 18x111 rectangle at position (382, 52).
; PLAN: r0=125(x1), r1=138(y1), r2=478(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=118(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=52(y), r12=18(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 138
LDI r2, 478
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 118
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 382
LDI r11, 52
LDI r12, 18
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
