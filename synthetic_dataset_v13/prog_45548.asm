; DESCRIPTION: Composite: Draws a orange line from (333, 180) to (262, 218) then Draws a red circle centered at (290, 173) with radius 75 then Places a magenta 51x112 rectangle at position (106, 109).
; PLAN: r0=333(x1), r1=180(y1), r2=262(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=173(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=109(y), r12=51(width), r13=112(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 180
LDI r2, 262
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 173
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 109
LDI r12, 51
LDI r13, 112
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
