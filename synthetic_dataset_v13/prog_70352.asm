; DESCRIPTION: Draws a white rectangle at (12, 38) with width 59 and height 93.
; PLAN: r0=12(x), r1=38(y), r2=59(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 38
LDI r2, 59
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
