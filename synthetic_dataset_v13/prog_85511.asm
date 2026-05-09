; DESCRIPTION: Composite: Sets a single black pixel at (293, 73) then Draws a magenta circle centered at (174, 176) with radius 52 then Renders a cyan line between points (371, 250) and (450, 72).
; PLAN: r0=293(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=176(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x1), r11=250(y1), r12=450(x2), r13=72(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 174
LDI r6, 176
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 250
LDI r12, 450
LDI r13, 72
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
