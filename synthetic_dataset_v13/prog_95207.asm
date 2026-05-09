; DESCRIPTION: Composite: Draws a yellow line from (79, 68) to (122, 214) then Draws a magenta circle centered at (67, 206) with radius 20 then Sets a single black pixel at (65, 27).
; PLAN: r0=79(x1), r1=68(y1), r2=122(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=206(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=27(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 68
LDI r2, 122
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 206
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 27
LDI r12, 0x000000
PSET r10, r11, r12
HALT
