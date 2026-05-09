; DESCRIPTION: Draws a white rectangle at (330, 146) with width 61 and height 36.
; PLAN: r0=330(x), r1=146(y), r2=61(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 146
LDI r2, 61
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
