; DESCRIPTION: Draws a yellow rectangle at (198, 133) with width 95 and height 77.
; PLAN: r0=198(x), r1=133(y), r2=95(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 133
LDI r2, 95
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
