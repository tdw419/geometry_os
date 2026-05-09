; DESCRIPTION: Composite: Sets a single red pixel at (198, 138) then Draws a magenta line from (206, 208) to (397, 44) then Draws a black circle centered at (420, 130) with radius 23.
; PLAN: r0=198(x), r1=138(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=208(y1), r7=397(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=130(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 138
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 206
LDI r6, 208
LDI r7, 397
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 130
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
