; DESCRIPTION: Composite: Draws a red rectangle at (429, 185) with width 64 and height 51 then Creates a purple circular shape at (356, 205) with radius 46 then Draws a magenta line from (335, 16) to (399, 146).
; PLAN: r0=429(x), r1=185(y), r2=64(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=205(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x1), r11=16(y1), r12=399(x2), r13=146(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 185
LDI r2, 64
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 205
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 16
LDI r12, 399
LDI r13, 146
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
