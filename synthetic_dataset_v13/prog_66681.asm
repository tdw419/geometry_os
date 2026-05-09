; DESCRIPTION: Composite: Renders a white disk with center (435, 160) and radius 43 then Places a black 82x95 rectangle at position (46, 56).
; PLAN: r0=435(x), r1=160(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=56(y), r7=82(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 160
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 56
LDI r7, 82
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
