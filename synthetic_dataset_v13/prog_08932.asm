; DESCRIPTION: Composite: Draws a red rectangle at (27, 120) with width 61 and height 52 then Places a yellow circle of radius 73 at center (311, 132) then Draws a magenta line from (245, 120) to (499, 230).
; PLAN: r0=27(x), r1=120(y), r2=61(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=132(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x1), r11=120(y1), r12=499(x2), r13=230(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 120
LDI r2, 61
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 132
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 120
LDI r12, 499
LDI r13, 230
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
