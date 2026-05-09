; DESCRIPTION: Composite: Draws a white rectangle at (327, 54) with width 38 and height 66 then Places a yellow dot at position (62, 60).
; PLAN: r0=327(x), r1=54(y), r2=38(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 54
LDI r2, 38
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
