; DESCRIPTION: Composite: Renders a yellow line between points (77, 221) and (228, 19) then Renders a cyan box of size 119x117 starting at (80, 126) then Draws a green circle centered at (132, 122) with radius 19.
; PLAN: r0=77(x1), r1=221(y1), r2=228(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=126(y), r7=119(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=122(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 221
LDI r2, 228
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 126
LDI r7, 119
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 122
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
