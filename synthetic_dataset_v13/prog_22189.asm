; DESCRIPTION: Draws a red rectangle at (381, 57) with width 80 and height 82.
; PLAN: r0=381(x), r1=57(y), r2=80(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 57
LDI r2, 80
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
