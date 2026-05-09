; DESCRIPTION: Composite: Draws a cyan rectangle at (195, 12) with width 100 and height 54 then Sets a single white pixel at (145, 168) then Renders a red line between points (181, 69) and (139, 70).
; PLAN: r0=195(x), r1=12(y), r2=100(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=69(y1), r12=139(x2), r13=70(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 12
LDI r2, 100
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 69
LDI r12, 139
LDI r13, 70
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
