; DESCRIPTION: Draws a green rectangle at (400, 184) with width 82 and height 45.
; PLAN: r0=400(x), r1=184(y), r2=82(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 184
LDI r2, 82
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
