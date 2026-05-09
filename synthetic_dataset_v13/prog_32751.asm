; DESCRIPTION: Composite: Creates a red circular shape at (375, 120) with radius 77 then Places a magenta 73x118 rectangle at position (211, 24) then Places a yellow dot at position (265, 183).
; PLAN: r0=375(x), r1=120(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=24(y), r7=73(width), r8=118(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=183(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 120
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 24
LDI r7, 73
LDI r8, 118
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 183
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
