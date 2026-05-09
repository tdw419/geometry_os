; DESCRIPTION: Composite: Places a green dot at position (182, 150) then Draws a magenta circle centered at (269, 146) with radius 38 then Renders a orange line between points (460, 153) and (265, 2).
; PLAN: r0=182(x), r1=150(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=146(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x1), r11=153(y1), r12=265(x2), r13=2(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 150
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 146
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 153
LDI r12, 265
LDI r13, 2
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
