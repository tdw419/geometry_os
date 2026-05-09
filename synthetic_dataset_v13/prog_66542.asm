; DESCRIPTION: Composite: Places a purple 52x87 rectangle at position (407, 102) then Places a blue circle of radius 49 at center (443, 202).
; PLAN: r0=407(x), r1=102(y), r2=52(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=202(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 102
LDI r2, 52
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 202
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
