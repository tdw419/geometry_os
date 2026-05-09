; DESCRIPTION: Draws a white rectangle at (164, 17) with width 117 and height 61.
; PLAN: r0=164(x), r1=17(y), r2=117(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 17
LDI r2, 117
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
