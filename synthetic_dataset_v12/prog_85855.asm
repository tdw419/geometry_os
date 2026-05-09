; DESCRIPTION: Composite: Places a blue 80x10 rectangle at position (52, 214) then Draws a green circle centered at (358, 73) with radius 34 then Places a orange line segment connecting (502, 30) to (20, 117).
; PLAN: r0=52(x), r1=214(y), r2=80(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=73(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x1), r11=30(y1), r12=20(x2), r13=117(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 214
LDI r2, 80
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 73
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 30
LDI r12, 20
LDI r13, 117
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
