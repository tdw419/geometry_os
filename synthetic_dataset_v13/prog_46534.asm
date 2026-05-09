; DESCRIPTION: Draws a red rectangle at (358, 98) with width 72 and height 82.
; PLAN: r0=358(x), r1=98(y), r2=72(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 98
LDI r2, 72
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
