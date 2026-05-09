; DESCRIPTION: Draws a red rectangle at (95, 124) with width 36 and height 59.
; PLAN: r0=95(x), r1=124(y), r2=36(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 124
LDI r2, 36
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
