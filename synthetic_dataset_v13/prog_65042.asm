; DESCRIPTION: Composite: Places a black circle of radius 38 at center (403, 176) then Places a white 97x63 rectangle at position (195, 93).
; PLAN: r0=403(x), r1=176(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=93(y), r7=97(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 176
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 93
LDI r7, 97
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
