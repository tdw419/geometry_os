; DESCRIPTION: Composite: Sets a single blue pixel at (108, 203) then Draws a magenta circle centered at (440, 103) with radius 57 then Draws a blue line from (365, 62) to (342, 7).
; PLAN: r0=108(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=103(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x1), r11=62(y1), r12=342(x2), r13=7(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 103
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 62
LDI r12, 342
LDI r13, 7
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
