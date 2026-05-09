; DESCRIPTION: Draws a orange rectangle at (409, 32) with width 94 and height 111.
; PLAN: r0=409(x), r1=32(y), r2=94(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 32
LDI r2, 94
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
