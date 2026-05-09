; DESCRIPTION: Composite: Places a white 52x43 rectangle at position (299, 5) then Renders a purple disk with center (246, 152) and radius 62.
; PLAN: r0=299(x), r1=5(y), r2=52(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=152(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 5
LDI r2, 52
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 152
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
