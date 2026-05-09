; DESCRIPTION: Composite: Sets a single magenta pixel at (500, 49) then Draws a red rectangle at (10, 148) with width 107 and height 98 then Renders a magenta line between points (497, 128) and (449, 196).
; PLAN: r0=500(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=148(y), r7=107(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=128(y1), r12=449(x2), r13=196(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 148
LDI r7, 107
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 128
LDI r12, 449
LDI r13, 196
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
