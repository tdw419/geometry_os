; DESCRIPTION: Composite: Renders a white line between points (467, 246) and (174, 218) then Places a black circle of radius 59 at center (283, 130) then Places a cyan dot at position (127, 247).
; PLAN: r0=467(x1), r1=246(y1), r2=174(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=130(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=247(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 467
LDI r1, 246
LDI r2, 174
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 130
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 247
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
