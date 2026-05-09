; DESCRIPTION: Draws a white rectangle at (308, 111) with width 49 and height 45.
; PLAN: r0=308(x), r1=111(y), r2=49(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 111
LDI r2, 49
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
