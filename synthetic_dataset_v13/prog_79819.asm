; DESCRIPTION: Composite: Places a yellow dot at position (39, 96) then Draws a yellow circle centered at (444, 73) with radius 64 then Draws a white line from (18, 72) to (35, 105).
; PLAN: r0=39(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=73(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=72(y1), r12=35(x2), r13=105(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 444
LDI r6, 73
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 72
LDI r12, 35
LDI r13, 105
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
