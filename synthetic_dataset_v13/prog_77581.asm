; DESCRIPTION: Composite: Places a red dot at position (459, 196) then Creates a red circular shape at (93, 216) with radius 11 then Places a cyan 107x36 rectangle at position (205, 195).
; PLAN: r0=459(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=216(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=205(x), r11=195(y), r12=107(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 216
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 205
LDI r11, 195
LDI r12, 107
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
