; DESCRIPTION: Composite: Places a yellow 60x78 rectangle at position (81, 52) then Draws a magenta circle centered at (365, 146) with radius 67 then Draws a white line from (408, 65) to (51, 224).
; PLAN: r0=81(x), r1=52(y), r2=60(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=146(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x1), r11=65(y1), r12=51(x2), r13=224(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 52
LDI r2, 60
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 146
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 65
LDI r12, 51
LDI r13, 224
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
