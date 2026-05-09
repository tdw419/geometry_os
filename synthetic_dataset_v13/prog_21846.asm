; DESCRIPTION: Draws a white rectangle at (422, 146) with width 73 and height 49.
; PLAN: r0=422(x), r1=146(y), r2=73(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 146
LDI r2, 73
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
