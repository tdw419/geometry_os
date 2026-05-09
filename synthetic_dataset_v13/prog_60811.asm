; DESCRIPTION: Composite: Renders a magenta disk with center (422, 157) and radius 67 then Places a white 83x28 rectangle at position (345, 15).
; PLAN: r0=422(x), r1=157(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=15(y), r7=83(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 157
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 15
LDI r7, 83
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
