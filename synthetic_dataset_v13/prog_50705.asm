; DESCRIPTION: Composite: Draws a white line from (511, 241) to (224, 243) then Creates a orange circular shape at (214, 155) with radius 67 then Places a purple dot at position (460, 3).
; PLAN: r0=511(x1), r1=241(y1), r2=224(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=155(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=3(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 511
LDI r1, 241
LDI r2, 224
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 155
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 3
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
