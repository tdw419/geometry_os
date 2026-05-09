; DESCRIPTION: Composite: Renders a red box of size 11x94 starting at (255, 133) then Creates a red circular shape at (434, 74) with radius 43 then Places a red dot at position (149, 138).
; PLAN: r0=255(x), r1=133(y), r2=11(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=74(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 133
LDI r2, 11
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 74
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
