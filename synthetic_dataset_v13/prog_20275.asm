; DESCRIPTION: Composite: Renders a blue disk with center (150, 139) and radius 47 then Places a black 78x73 rectangle at position (191, 121).
; PLAN: r0=150(x), r1=139(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=121(y), r7=78(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 139
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 121
LDI r7, 78
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
