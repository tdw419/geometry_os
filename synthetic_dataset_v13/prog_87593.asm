; DESCRIPTION: Composite: Creates a yellow circular shape at (258, 74) with radius 54 then Sets a single red pixel at (251, 118) then Places a yellow 107x43 rectangle at position (290, 26).
; PLAN: r0=258(x), r1=74(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=118(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=26(y), r12=107(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 74
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 118
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 290
LDI r11, 26
LDI r12, 107
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
