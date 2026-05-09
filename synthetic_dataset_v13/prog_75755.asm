; DESCRIPTION: Draws a white rectangle at (425, 163) with width 74 and height 71.
; PLAN: r0=425(x), r1=163(y), r2=74(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 163
LDI r2, 74
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
