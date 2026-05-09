; DESCRIPTION: Composite: Places a orange circle of radius 74 at center (421, 127) then Places a white 94x20 rectangle at position (159, 117).
; PLAN: r0=421(x), r1=127(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=117(y), r7=94(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 127
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 117
LDI r7, 94
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
