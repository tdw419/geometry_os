; DESCRIPTION: Draws a red rectangle at (317, 61) with width 14 and height 68.
; PLAN: r0=317(x), r1=61(y), r2=14(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 61
LDI r2, 14
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
