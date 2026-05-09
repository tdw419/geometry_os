; DESCRIPTION: Draws a white rectangle at (47, 168) with width 115 and height 64.
; PLAN: r0=47(x), r1=168(y), r2=115(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 168
LDI r2, 115
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
