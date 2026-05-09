; DESCRIPTION: Draws a red rectangle at (189, 204) with width 117 and height 29.
; PLAN: r0=189(x), r1=204(y), r2=117(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 204
LDI r2, 117
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
