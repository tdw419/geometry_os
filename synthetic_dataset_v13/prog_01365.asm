; DESCRIPTION: Draws a orange rectangle at (82, 65) with width 92 and height 102.
; PLAN: r0=82(x), r1=65(y), r2=92(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 65
LDI r2, 92
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
