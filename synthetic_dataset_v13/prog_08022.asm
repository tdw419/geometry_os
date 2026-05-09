; DESCRIPTION: Draws a orange rectangle at (58, 82) with width 82 and height 57.
; PLAN: r0=58(x), r1=82(y), r2=82(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 82
LDI r2, 82
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
