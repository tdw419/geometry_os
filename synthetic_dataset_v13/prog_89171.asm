; DESCRIPTION: Draws a red rectangle at (349, 59) with width 54 and height 76.
; PLAN: r0=349(x), r1=59(y), r2=54(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 59
LDI r2, 54
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
