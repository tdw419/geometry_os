; DESCRIPTION: Composite: Renders a orange line between points (243, 126) and (330, 54) then Places a magenta dot at position (289, 111) then Draws a magenta circle centered at (433, 88) with radius 32.
; PLAN: r0=243(x1), r1=126(y1), r2=330(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=111(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=433(x), r11=88(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 126
LDI r2, 330
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 111
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 433
LDI r11, 88
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
