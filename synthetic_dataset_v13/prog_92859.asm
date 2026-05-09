; DESCRIPTION: Draws a white rectangle at (308, 127) with width 11 and height 71.
; PLAN: r0=308(x), r1=127(y), r2=11(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 127
LDI r2, 11
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
