; DESCRIPTION: Draws a white rectangle at (369, 31) with width 61 and height 95.
; PLAN: r0=369(x), r1=31(y), r2=61(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 31
LDI r2, 61
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
