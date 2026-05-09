; DESCRIPTION: Composite: Places a purple dot at position (116, 235) then Places a red 93x33 rectangle at position (318, 215) then Places a cyan circle of radius 13 at center (241, 124).
; PLAN: r0=116(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=215(y), r7=93(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=124(y), r12=13(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 215
LDI r7, 93
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 124
LDI r12, 13
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
