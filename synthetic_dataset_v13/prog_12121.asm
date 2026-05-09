; DESCRIPTION: Composite: Creates a blue circular shape at (313, 168) with radius 60 then Draws a magenta line from (338, 113) to (57, 75) then Sets a single purple pixel at (496, 130).
; PLAN: r0=313(x), r1=168(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=113(y1), r7=57(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=130(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 168
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 113
LDI r7, 57
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 130
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
