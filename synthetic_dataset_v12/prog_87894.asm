; DESCRIPTION: Composite: Renders a white disk with center (256, 98) and radius 31 then Places a red 68x43 rectangle at position (82, 158) then Sets a single yellow pixel at (115, 95).
; PLAN: r0=256(x), r1=98(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=158(y), r7=68(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x), r11=95(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 98
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 158
LDI r7, 68
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 95
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
