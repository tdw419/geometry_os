; DESCRIPTION: Composite: Sets a single cyan pixel at (125, 119) then Creates a white circular shape at (426, 62) with radius 56 then Renders a green line between points (169, 67) and (387, 87).
; PLAN: r0=125(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=62(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x1), r11=67(y1), r12=387(x2), r13=87(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 62
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 67
LDI r12, 387
LDI r13, 87
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
