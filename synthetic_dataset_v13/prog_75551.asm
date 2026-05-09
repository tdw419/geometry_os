; DESCRIPTION: Composite: Places a red circle of radius 59 at center (209, 63) then Draws a orange rectangle at (288, 43) with width 111 and height 109 then Draws a orange line from (356, 193) to (180, 209).
; PLAN: r0=209(x), r1=63(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=43(y), r7=111(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x1), r11=193(y1), r12=180(x2), r13=209(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 63
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 43
LDI r7, 111
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 193
LDI r12, 180
LDI r13, 209
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
