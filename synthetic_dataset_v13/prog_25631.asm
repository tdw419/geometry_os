; DESCRIPTION: Draws a white rectangle at (73, 25) with width 58 and height 57.
; PLAN: r0=73(x), r1=25(y), r2=58(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 25
LDI r2, 58
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
