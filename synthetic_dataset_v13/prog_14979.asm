; DESCRIPTION: Draws a red rectangle at (247, 103) with width 23 and height 65.
; PLAN: r0=247(x), r1=103(y), r2=23(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 103
LDI r2, 23
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
