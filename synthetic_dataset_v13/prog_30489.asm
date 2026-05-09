; DESCRIPTION: Composite: Places a white dot at position (303, 167) then Creates a red circular shape at (420, 108) with radius 61 then Places a yellow 23x94 rectangle at position (196, 36).
; PLAN: r0=303(x), r1=167(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=108(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x), r11=36(y), r12=23(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 167
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 108
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 36
LDI r12, 23
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
