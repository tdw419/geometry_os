; DESCRIPTION: Draws a white rectangle at (95, 64) with width 54 and height 108.
; PLAN: r0=95(x), r1=64(y), r2=54(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 64
LDI r2, 54
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
