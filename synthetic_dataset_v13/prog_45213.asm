; DESCRIPTION: Composite: Renders a magenta disk with center (325, 102) and radius 44 then Renders a red line between points (5, 124) and (107, 32) then Sets a single purple pixel at (408, 113).
; PLAN: r0=325(x), r1=102(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x1), r6=124(y1), r7=107(x2), r8=32(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=113(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 102
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 124
LDI r7, 107
LDI r8, 32
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 113
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
