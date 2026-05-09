; DESCRIPTION: Composite: Places a yellow dot at position (57, 66) then Renders a white line between points (454, 135) and (455, 90) then Renders a yellow disk with center (42, 176) and radius 20.
; PLAN: r0=57(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=454(x1), r6=135(y1), r7=455(x2), r8=90(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=176(y), r12=20(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 454
LDI r6, 135
LDI r7, 455
LDI r8, 90
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 176
LDI r12, 20
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
