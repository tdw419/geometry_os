; DESCRIPTION: Composite: Renders a orange box of size 51x24 starting at (107, 32) then Places a blue circle of radius 44 at center (81, 153) then Draws a red line from (227, 132) to (386, 114).
; PLAN: r0=107(x), r1=32(y), r2=51(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=153(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x1), r11=132(y1), r12=386(x2), r13=114(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 32
LDI r2, 51
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 153
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 132
LDI r12, 386
LDI r13, 114
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
