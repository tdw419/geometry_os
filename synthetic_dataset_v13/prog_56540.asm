; DESCRIPTION: Draws a white rectangle at (237, 20) with width 47 and height 102.
; PLAN: r0=237(x), r1=20(y), r2=47(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 20
LDI r2, 47
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
