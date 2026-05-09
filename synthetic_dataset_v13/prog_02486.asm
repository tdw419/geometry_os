; DESCRIPTION: Composite: Places a purple circle of radius 16 at center (339, 77) then Places a red 82x56 rectangle at position (279, 155).
; PLAN: r0=339(x), r1=77(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=155(y), r7=82(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 77
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 155
LDI r7, 82
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
