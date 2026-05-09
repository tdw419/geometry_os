; DESCRIPTION: Draws a green rectangle at (180, 38) with width 95 and height 103.
; PLAN: r0=180(x), r1=38(y), r2=95(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 38
LDI r2, 95
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
