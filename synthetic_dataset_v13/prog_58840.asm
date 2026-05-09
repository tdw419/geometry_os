; DESCRIPTION: Composite: Draws a orange circle centered at (146, 125) with radius 74 then Renders a yellow line between points (370, 236) and (129, 134) then Places a magenta 15x76 rectangle at position (365, 20).
; PLAN: r0=146(x), r1=125(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x1), r6=236(y1), r7=129(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=20(y), r12=15(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 125
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 236
LDI r7, 129
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 20
LDI r12, 15
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
