; DESCRIPTION: Composite: Renders a white disk with center (293, 100) and radius 77 then Draws a magenta line from (43, 92) to (427, 181) then Draws a orange rectangle at (382, 85) with width 23 and height 111.
; PLAN: r0=293(x), r1=100(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x1), r6=92(y1), r7=427(x2), r8=181(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=85(y), r12=23(width), r13=111(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 100
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 92
LDI r7, 427
LDI r8, 181
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 85
LDI r12, 23
LDI r13, 111
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
