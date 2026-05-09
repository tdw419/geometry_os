; DESCRIPTION: Composite: Renders a blue disk with center (223, 198) and radius 50 then Places a black 91x112 rectangle at position (326, 49).
; PLAN: r0=223(x), r1=198(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=49(y), r7=91(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 198
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 49
LDI r7, 91
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
