; DESCRIPTION: Draws a white rectangle at (180, 157) with width 36 and height 46.
; PLAN: r0=180(x), r1=157(y), r2=36(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 157
LDI r2, 36
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
