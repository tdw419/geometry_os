; DESCRIPTION: Composite: Places a purple 115x57 rectangle at position (281, 42) then Places a purple circle of radius 31 at center (373, 176).
; PLAN: r0=281(x), r1=42(y), r2=115(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=176(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 42
LDI r2, 115
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 176
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
