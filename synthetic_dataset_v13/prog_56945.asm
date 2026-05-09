; DESCRIPTION: Composite: Draws a magenta line from (291, 44) to (444, 178) then Sets a single purple pixel at (400, 121) then Draws a cyan circle centered at (92, 122) with radius 66.
; PLAN: r0=291(x1), r1=44(y1), r2=444(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=121(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=122(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 44
LDI r2, 444
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 121
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 122
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
