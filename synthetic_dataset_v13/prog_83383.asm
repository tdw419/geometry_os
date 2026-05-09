; DESCRIPTION: Composite: Places a orange 38x53 rectangle at position (422, 31) then Renders a purple disk with center (418, 87) and radius 57.
; PLAN: r0=422(x), r1=31(y), r2=38(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=87(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 31
LDI r2, 38
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 87
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
