; DESCRIPTION: Composite: Sets a single black pixel at (240, 205) then Draws a black rectangle at (170, 71) with width 52 and height 112 then Draws a yellow line from (267, 54) to (160, 167).
; PLAN: r0=240(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=71(y), r7=52(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x1), r11=54(y1), r12=160(x2), r13=167(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 170
LDI r6, 71
LDI r7, 52
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 54
LDI r12, 160
LDI r13, 167
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
