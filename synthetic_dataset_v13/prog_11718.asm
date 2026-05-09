; DESCRIPTION: Draws a white rectangle at (394, 14) with width 75 and height 52.
; PLAN: r0=394(x), r1=14(y), r2=75(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 14
LDI r2, 75
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
