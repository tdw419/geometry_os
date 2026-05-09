; DESCRIPTION: Composite: Sets a single blue pixel at (268, 188) then Places a cyan circle of radius 63 at center (272, 77) then Renders a blue line between points (218, 145) and (372, 86).
; PLAN: r0=268(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=77(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x1), r11=145(y1), r12=372(x2), r13=86(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 77
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 145
LDI r12, 372
LDI r13, 86
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
