; DESCRIPTION: Draws a red rectangle at (334, 82) with width 70 and height 108.
; PLAN: r0=334(x), r1=82(y), r2=70(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 82
LDI r2, 70
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
