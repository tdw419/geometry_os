; DESCRIPTION: Draws a white rectangle at (197, 177) with width 49 and height 74.
; PLAN: r0=197(x), r1=177(y), r2=49(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 177
LDI r2, 49
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
