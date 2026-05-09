; DESCRIPTION: Draws a white rectangle at (372, 192) with width 45 and height 44.
; PLAN: r0=372(x), r1=192(y), r2=45(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 192
LDI r2, 45
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
