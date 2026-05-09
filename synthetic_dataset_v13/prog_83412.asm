; DESCRIPTION: Draws a white rectangle at (333, 54) with width 57 and height 47.
; PLAN: r0=333(x), r1=54(y), r2=57(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 54
LDI r2, 57
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
