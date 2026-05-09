; DESCRIPTION: Composite: Draws a white circle centered at (117, 142) with radius 20 then Draws a red line from (174, 164) to (86, 102) then Draws a orange rectangle at (374, 40) with width 51 and height 27.
; PLAN: r0=117(x), r1=142(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=164(y1), r7=86(x2), r8=102(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=40(y), r12=51(width), r13=27(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 142
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 164
LDI r7, 86
LDI r8, 102
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 40
LDI r12, 51
LDI r13, 27
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
