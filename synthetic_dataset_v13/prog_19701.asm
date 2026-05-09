; DESCRIPTION: Composite: Places a cyan dot at position (380, 241) then Creates a black circular shape at (96, 135) with radius 51 then Draws a yellow line from (485, 234) to (34, 34).
; PLAN: r0=380(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=135(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x1), r11=234(y1), r12=34(x2), r13=34(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 135
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 234
LDI r12, 34
LDI r13, 34
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
