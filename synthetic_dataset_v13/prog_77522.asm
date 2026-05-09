; DESCRIPTION: Composite: Draws a black rectangle at (228, 174) with width 98 and height 28 then Draws a red line from (375, 172) to (446, 213) then Renders a yellow disk with center (372, 94) and radius 36.
; PLAN: r0=228(x), r1=174(y), r2=98(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=172(y1), r7=446(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=94(y), r12=36(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 174
LDI r2, 98
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 172
LDI r7, 446
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 94
LDI r12, 36
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
