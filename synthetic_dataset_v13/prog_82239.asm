; DESCRIPTION: Composite: Places a black circle of radius 33 at center (94, 52) then Places a black 48x70 rectangle at position (49, 2).
; PLAN: r0=94(x), r1=52(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=2(y), r7=48(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 52
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 2
LDI r7, 48
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
