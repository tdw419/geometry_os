; DESCRIPTION: Draws a white rectangle at (94, 74) with width 65 and height 10.
; PLAN: r0=94(x), r1=74(y), r2=65(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 74
LDI r2, 65
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
