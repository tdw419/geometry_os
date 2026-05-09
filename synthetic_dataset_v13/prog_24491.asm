; DESCRIPTION: Composite: Creates a red circular shape at (170, 74) with radius 62 then Renders a purple box of size 61x66 starting at (341, 187).
; PLAN: r0=170(x), r1=74(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=187(y), r7=61(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 74
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 187
LDI r7, 61
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
