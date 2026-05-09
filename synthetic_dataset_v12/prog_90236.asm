; DESCRIPTION: Composite: Renders a yellow disk with center (409, 181) and radius 51 then Renders a yellow box of size 100x21 starting at (1, 221) then Renders a orange line between points (281, 166) and (330, 135).
; PLAN: r0=409(x), r1=181(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=221(y), r7=100(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x1), r11=166(y1), r12=330(x2), r13=135(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 181
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 221
LDI r7, 100
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 166
LDI r12, 330
LDI r13, 135
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
