; DESCRIPTION: Composite: Renders a red disk with center (296, 94) and radius 18 then Places a black 84x72 rectangle at position (309, 112).
; PLAN: r0=296(x), r1=94(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=112(y), r7=84(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 94
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 112
LDI r7, 84
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
