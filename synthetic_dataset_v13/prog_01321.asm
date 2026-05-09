; DESCRIPTION: Composite: Renders a white disk with center (299, 213) and radius 19 then Renders a blue box of size 94x117 starting at (118, 12).
; PLAN: r0=299(x), r1=213(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=12(y), r7=94(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 213
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 12
LDI r7, 94
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
