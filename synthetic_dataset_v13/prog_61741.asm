; DESCRIPTION: Draws a red rectangle at (59, 82) with width 76 and height 98.
; PLAN: r0=59(x), r1=82(y), r2=76(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 82
LDI r2, 76
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
