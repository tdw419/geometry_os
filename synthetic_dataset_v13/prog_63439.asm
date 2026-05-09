; DESCRIPTION: Composite: Sets a single orange pixel at (501, 123) then Draws a red circle centered at (454, 111) with radius 29 then Draws a cyan line from (506, 11) to (196, 128).
; PLAN: r0=501(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=111(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=506(x1), r11=11(y1), r12=196(x2), r13=128(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 454
LDI r6, 111
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 506
LDI r11, 11
LDI r12, 196
LDI r13, 128
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
