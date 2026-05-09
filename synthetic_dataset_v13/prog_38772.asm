; DESCRIPTION: Composite: Sets a single black pixel at (419, 186) then Creates a red circular shape at (67, 213) with radius 15 then Places a yellow 81x14 rectangle at position (306, 177).
; PLAN: r0=419(x), r1=186(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=213(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=177(y), r12=81(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 186
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 67
LDI r6, 213
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 177
LDI r12, 81
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
