; DESCRIPTION: Draws a white rectangle at (193, 57) with width 75 and height 10.
; PLAN: r0=193(x), r1=57(y), r2=75(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 57
LDI r2, 75
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
