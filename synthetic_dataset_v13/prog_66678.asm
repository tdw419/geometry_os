; DESCRIPTION: Draws a white rectangle at (178, 93) with width 68 and height 95.
; PLAN: r0=178(x), r1=93(y), r2=68(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 93
LDI r2, 68
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
