; DESCRIPTION: Draws a red rectangle at (373, 126) with width 24 and height 61.
; PLAN: r0=373(x), r1=126(y), r2=24(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 126
LDI r2, 24
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
