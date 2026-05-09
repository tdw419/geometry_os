; DESCRIPTION: Composite: Renders a red disk with center (335, 92) and radius 74 then Places a black 49x47 rectangle at position (350, 56).
; PLAN: r0=335(x), r1=92(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=56(y), r7=49(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 92
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 56
LDI r7, 49
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
