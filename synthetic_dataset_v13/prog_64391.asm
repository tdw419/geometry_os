; DESCRIPTION: Composite: Renders a blue disk with center (143, 150) and radius 23 then Renders a blue box of size 46x34 starting at (282, 94).
; PLAN: r0=143(x), r1=150(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=94(y), r7=46(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 150
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 94
LDI r7, 46
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
