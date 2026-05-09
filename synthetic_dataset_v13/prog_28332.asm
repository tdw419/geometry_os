; DESCRIPTION: Draws a white rectangle at (246, 154) with width 115 and height 72.
; PLAN: r0=246(x), r1=154(y), r2=115(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 154
LDI r2, 115
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
