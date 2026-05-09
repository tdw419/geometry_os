; DESCRIPTION: Composite: Places a cyan line segment connecting (227, 112) to (51, 239) then Renders a yellow disk with center (281, 60) and radius 55 then Draws a magenta rectangle at (12, 38) with width 51 and height 96.
; PLAN: r0=227(x1), r1=112(y1), r2=51(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=60(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=38(y), r12=51(width), r13=96(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 112
LDI r2, 51
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 60
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 38
LDI r12, 51
LDI r13, 96
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
