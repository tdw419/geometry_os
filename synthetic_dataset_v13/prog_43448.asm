; DESCRIPTION: Composite: Sets a single magenta pixel at (205, 8) then Creates a white circular shape at (387, 125) with radius 71 then Renders a white line between points (23, 1) and (323, 14).
; PLAN: r0=205(x), r1=8(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=125(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x1), r11=1(y1), r12=323(x2), r13=14(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 8
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 125
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 1
LDI r12, 323
LDI r13, 14
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
