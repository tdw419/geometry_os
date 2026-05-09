; DESCRIPTION: Draws a white rectangle at (220, 204) with width 38 and height 47.
; PLAN: r0=220(x), r1=204(y), r2=38(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 204
LDI r2, 38
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
