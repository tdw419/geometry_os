; DESCRIPTION: Draws a white rectangle at (213, 119) with width 61 and height 93.
; PLAN: r0=213(x), r1=119(y), r2=61(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 119
LDI r2, 61
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
