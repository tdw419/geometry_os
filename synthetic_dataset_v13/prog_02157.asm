; DESCRIPTION: Composite: Places a magenta circle of radius 41 at center (55, 129) then Places a blue 11x81 rectangle at position (65, 131) then Places a yellow line segment connecting (64, 204) to (120, 51).
; PLAN: r0=55(x), r1=129(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=131(y), r7=11(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=64(x1), r11=204(y1), r12=120(x2), r13=51(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 129
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 131
LDI r7, 11
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 204
LDI r12, 120
LDI r13, 51
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
