; DESCRIPTION: Composite: Sets a single purple pixel at (234, 27) then Places a magenta circle of radius 31 at center (292, 59) then Renders a yellow line between points (114, 151) and (381, 40).
; PLAN: r0=234(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=59(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x1), r11=151(y1), r12=381(x2), r13=40(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 59
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 151
LDI r12, 381
LDI r13, 40
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
