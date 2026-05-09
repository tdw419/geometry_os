; DESCRIPTION: Composite: Renders a magenta disk with center (99, 165) and radius 38 then Places a green 89x78 rectangle at position (251, 1) then Places a cyan line segment connecting (488, 100) to (214, 75).
; PLAN: r0=99(x), r1=165(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=1(y), r7=89(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=488(x1), r11=100(y1), r12=214(x2), r13=75(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 165
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 1
LDI r7, 89
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 100
LDI r12, 214
LDI r13, 75
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
