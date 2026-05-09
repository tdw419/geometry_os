; DESCRIPTION: Composite: Renders a black disk with center (171, 89) and radius 74 then Places a magenta 116x26 rectangle at position (201, 56).
; PLAN: r0=171(x), r1=89(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=56(y), r7=116(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 89
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 56
LDI r7, 116
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
