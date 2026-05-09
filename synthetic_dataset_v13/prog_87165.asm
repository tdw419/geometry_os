; DESCRIPTION: Draws a white rectangle at (186, 36) with width 103 and height 115.
; PLAN: r0=186(x), r1=36(y), r2=103(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 36
LDI r2, 103
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
