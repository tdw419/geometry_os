; DESCRIPTION: Draws a red rectangle at (198, 80) with width 30 and height 59.
; PLAN: r0=198(x), r1=80(y), r2=30(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 80
LDI r2, 30
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
