; DESCRIPTION: Composite: Renders a black line between points (329, 10) and (333, 179) then Draws a magenta rectangle at (88, 2) with width 65 and height 54 then Sets a single black pixel at (346, 194).
; PLAN: r0=329(x1), r1=10(y1), r2=333(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=2(y), r7=65(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=194(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 10
LDI r2, 333
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 2
LDI r7, 65
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 194
LDI r12, 0x000000
PSET r10, r11, r12
HALT
