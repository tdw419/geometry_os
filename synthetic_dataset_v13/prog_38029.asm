; DESCRIPTION: Composite: Places a blue circle of radius 43 at center (351, 122) then Places a cyan 14x99 rectangle at position (209, 24).
; PLAN: r0=351(x), r1=122(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=24(y), r7=14(width), r8=99(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 122
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 24
LDI r7, 14
LDI r8, 99
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
