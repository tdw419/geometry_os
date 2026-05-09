; DESCRIPTION: Composite: Places a green 32x29 rectangle at position (475, 122) then Places a cyan circle of radius 18 at center (319, 161).
; PLAN: r0=475(x), r1=122(y), r2=32(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=161(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 122
LDI r2, 32
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 161
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
