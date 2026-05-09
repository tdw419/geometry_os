; DESCRIPTION: Composite: Sets a single black pixel at (190, 55) then Draws a magenta circle centered at (289, 86) with radius 52 then Renders a red line between points (39, 249) and (460, 208).
; PLAN: r0=190(x), r1=55(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=86(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=39(x1), r11=249(y1), r12=460(x2), r13=208(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 55
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 86
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 39
LDI r11, 249
LDI r12, 460
LDI r13, 208
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
