; DESCRIPTION: Composite: Sets a single magenta pixel at (48, 108) then Places a red 17x80 rectangle at position (208, 76) then Places a orange line segment connecting (467, 186) to (212, 153).
; PLAN: r0=48(x), r1=108(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=76(y), r7=17(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x1), r11=186(y1), r12=212(x2), r13=153(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 108
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 76
LDI r7, 17
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 186
LDI r12, 212
LDI r13, 153
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
