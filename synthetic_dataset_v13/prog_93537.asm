; DESCRIPTION: Composite: Draws a white rectangle at (401, 74) with width 26 and height 83 then Places a green circle of radius 46 at center (365, 52).
; PLAN: r0=401(x), r1=74(y), r2=26(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=52(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 74
LDI r2, 26
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 52
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
