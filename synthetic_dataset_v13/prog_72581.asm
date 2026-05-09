; DESCRIPTION: Draws a white rectangle at (409, 38) with width 99 and height 42.
; PLAN: r0=409(x), r1=38(y), r2=99(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 38
LDI r2, 99
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
