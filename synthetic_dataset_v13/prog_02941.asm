; DESCRIPTION: Composite: Places a yellow 43x28 rectangle at position (404, 158) then Places a red circle of radius 21 at center (433, 116) then Places a yellow dot at position (93, 81).
; PLAN: r0=404(x), r1=158(y), r2=43(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=116(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=93(x), r11=81(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 158
LDI r2, 43
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 116
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 93
LDI r11, 81
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
