; DESCRIPTION: Composite: Creates a magenta circular shape at (437, 180) with radius 58 then Sets a single magenta pixel at (124, 248) then Draws a green line from (165, 21) to (299, 112).
; PLAN: r0=437(x), r1=180(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=248(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=165(x1), r11=21(y1), r12=299(x2), r13=112(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 180
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 248
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 21
LDI r12, 299
LDI r13, 112
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
