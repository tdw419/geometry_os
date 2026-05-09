; DESCRIPTION: Composite: Draws a magenta rectangle at (277, 45) with width 63 and height 14 then Renders a magenta disk with center (254, 179) and radius 54 then Draws a cyan line from (174, 115) to (104, 32).
; PLAN: r0=277(x), r1=45(y), r2=63(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=179(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x1), r11=115(y1), r12=104(x2), r13=32(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 45
LDI r2, 63
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 179
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 115
LDI r12, 104
LDI r13, 32
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
