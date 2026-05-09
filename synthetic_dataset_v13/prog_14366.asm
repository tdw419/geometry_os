; DESCRIPTION: Composite: Sets a single cyan pixel at (367, 201) then Draws a black circle centered at (60, 43) with radius 31 then Draws a green line from (313, 176) to (354, 232).
; PLAN: r0=367(x), r1=201(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=43(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x1), r11=176(y1), r12=354(x2), r13=232(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 201
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 60
LDI r6, 43
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 176
LDI r12, 354
LDI r13, 232
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
