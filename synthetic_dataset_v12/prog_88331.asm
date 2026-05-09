; DESCRIPTION: Draws a red rectangle at (143, 45) with width 70 and height 59.
; PLAN: r0=143(x), r1=45(y), r2=70(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 45
LDI r2, 70
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
