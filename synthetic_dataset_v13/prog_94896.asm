; DESCRIPTION: Composite: Renders a red disk with center (103, 139) and radius 23 then Renders a blue box of size 107x16 starting at (379, 148).
; PLAN: r0=103(x), r1=139(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=148(y), r7=107(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 139
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 148
LDI r7, 107
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
