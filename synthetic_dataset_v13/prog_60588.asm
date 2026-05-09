; DESCRIPTION: Composite: Draws a orange rectangle at (421, 215) with width 80 and height 38 then Sets a single red pixel at (327, 12) then Draws a magenta line from (173, 118) to (225, 44).
; PLAN: r0=421(x), r1=215(y), r2=80(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=173(x1), r11=118(y1), r12=225(x2), r13=44(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 215
LDI r2, 80
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 173
LDI r11, 118
LDI r12, 225
LDI r13, 44
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
