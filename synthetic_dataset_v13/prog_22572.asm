; DESCRIPTION: Composite: Sets a single green pixel at (242, 237) then Places a red 77x57 rectangle at position (118, 146) then Places a purple circle of radius 52 at center (61, 163).
; PLAN: r0=242(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=146(y), r7=77(width), r8=57(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=163(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 118
LDI r6, 146
LDI r7, 77
LDI r8, 57
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 163
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
