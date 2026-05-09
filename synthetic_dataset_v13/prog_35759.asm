; DESCRIPTION: Draws a red rectangle at (221, 86) with width 72 and height 98.
; PLAN: r0=221(x), r1=86(y), r2=72(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 86
LDI r2, 72
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
