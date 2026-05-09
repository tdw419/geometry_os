; DESCRIPTION: Draws a red rectangle at (206, 59) with width 55 and height 39.
; PLAN: r0=206(x), r1=59(y), r2=55(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 59
LDI r2, 55
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
