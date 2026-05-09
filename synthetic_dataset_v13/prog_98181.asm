; DESCRIPTION: Composite: Draws a yellow circle centered at (243, 131) with radius 60 then Renders a yellow line between points (373, 234) and (111, 204) then Draws a cyan rectangle at (57, 118) with width 118 and height 41.
; PLAN: r0=243(x), r1=131(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=234(y1), r7=111(x2), r8=204(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=118(y), r12=118(width), r13=41(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 131
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 234
LDI r7, 111
LDI r8, 204
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 118
LDI r12, 118
LDI r13, 41
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
