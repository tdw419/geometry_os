; DESCRIPTION: Composite: Draws a orange circle centered at (173, 185) with radius 36 then Sets a single purple pixel at (397, 248) then Renders a cyan line between points (511, 0) and (455, 81).
; PLAN: r0=173(x), r1=185(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=248(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=511(x1), r11=0(y1), r12=455(x2), r13=81(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 185
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 248
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 511
LDI r11, 0
LDI r12, 455
LDI r13, 81
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
