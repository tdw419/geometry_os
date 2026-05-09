; DESCRIPTION: Composite: Sets a single red pixel at (108, 160) then Places a cyan 57x109 rectangle at position (426, 43) then Renders a red disk with center (413, 94) and radius 66.
; PLAN: r0=108(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=43(y), r7=57(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=94(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 426
LDI r6, 43
LDI r7, 57
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 94
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
