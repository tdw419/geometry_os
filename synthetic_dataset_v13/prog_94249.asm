; DESCRIPTION: Composite: Places a blue circle of radius 71 at center (303, 128) then Places a purple 23x25 rectangle at position (422, 62).
; PLAN: r0=303(x), r1=128(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=62(y), r7=23(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 128
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 62
LDI r7, 23
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
