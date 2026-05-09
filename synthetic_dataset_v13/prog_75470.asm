; DESCRIPTION: Composite: Creates a orange circular shape at (354, 100) with radius 43 then Places a white line segment connecting (492, 164) to (502, 122) then Draws a magenta rectangle at (96, 210) with width 41 and height 29.
; PLAN: r0=354(x), r1=100(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=164(y1), r7=502(x2), r8=122(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=210(y), r12=41(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 100
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 164
LDI r7, 502
LDI r8, 122
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 210
LDI r12, 41
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
