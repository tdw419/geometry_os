; DESCRIPTION: Composite: Sets a single purple pixel at (464, 28) then Places a yellow 71x114 rectangle at position (255, 47) then Creates a red circular shape at (341, 101) with radius 68.
; PLAN: r0=464(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=47(y), r7=71(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x), r11=101(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 47
LDI r7, 71
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 101
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
