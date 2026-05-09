; DESCRIPTION: Draws a white rectangle at (304, 161) with width 53 and height 95.
; PLAN: r0=304(x), r1=161(y), r2=53(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 161
LDI r2, 53
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
