; DESCRIPTION: Composite: Renders a orange disk with center (133, 140) and radius 50 then Places a black 78x55 rectangle at position (422, 7).
; PLAN: r0=133(x), r1=140(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=7(y), r7=78(width), r8=55(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 140
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 7
LDI r7, 78
LDI r8, 55
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
