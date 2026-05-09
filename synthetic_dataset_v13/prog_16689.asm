; DESCRIPTION: Composite: Sets a single black pixel at (50, 151) then Renders a red disk with center (237, 213) and radius 39 then Renders a red line between points (376, 231) and (159, 218).
; PLAN: r0=50(x), r1=151(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=213(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x1), r11=231(y1), r12=159(x2), r13=218(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 151
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 237
LDI r6, 213
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 231
LDI r12, 159
LDI r13, 218
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
