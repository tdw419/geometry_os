; DESCRIPTION: Composite: Renders a red disk with center (83, 95) and radius 78 then Places a green 10x97 rectangle at position (107, 47).
; PLAN: r0=83(x), r1=95(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=47(y), r7=10(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 95
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 47
LDI r7, 10
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
