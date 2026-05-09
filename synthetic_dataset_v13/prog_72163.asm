; DESCRIPTION: Composite: Creates a blue circular shape at (192, 177) with radius 28 then Places a red 12x116 rectangle at position (151, 55).
; PLAN: r0=192(x), r1=177(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=55(y), r7=12(width), r8=116(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 177
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 55
LDI r7, 12
LDI r8, 116
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
