; DESCRIPTION: Draws a red rectangle at (441, 176) with width 57 and height 39.
; PLAN: r0=441(x), r1=176(y), r2=57(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 176
LDI r2, 57
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
