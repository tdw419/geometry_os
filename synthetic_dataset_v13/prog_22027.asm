; DESCRIPTION: Composite: Renders a black box of size 61x44 starting at (101, 46) then Draws a cyan circle centered at (241, 165) with radius 66 then Draws a magenta line from (361, 116) to (31, 105).
; PLAN: r0=101(x), r1=46(y), r2=61(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=165(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x1), r11=116(y1), r12=31(x2), r13=105(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 46
LDI r2, 61
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 165
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 116
LDI r12, 31
LDI r13, 105
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
