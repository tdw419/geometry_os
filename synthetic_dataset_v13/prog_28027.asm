; DESCRIPTION: Draws a white rectangle at (36, 40) with width 93 and height 86.
; PLAN: r0=36(x), r1=40(y), r2=93(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 40
LDI r2, 93
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
