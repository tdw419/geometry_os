; DESCRIPTION: Composite: Renders a cyan disk with center (190, 83) and radius 74 then Places a red 115x88 rectangle at position (107, 95).
; PLAN: r0=190(x), r1=83(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=95(y), r7=115(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 83
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 95
LDI r7, 115
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
