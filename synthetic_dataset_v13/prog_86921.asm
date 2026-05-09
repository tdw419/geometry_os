; DESCRIPTION: Composite: Sets a single blue pixel at (245, 108) then Renders a green line between points (121, 56) and (382, 60) then Places a green 100x94 rectangle at position (159, 80).
; PLAN: r0=245(x), r1=108(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=56(y1), r7=382(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=80(y), r12=100(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 108
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 56
LDI r7, 382
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 80
LDI r12, 100
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
