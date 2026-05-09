; DESCRIPTION: Draws a white rectangle at (66, 100) with width 64 and height 61.
; PLAN: r0=66(x), r1=100(y), r2=64(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 100
LDI r2, 64
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
