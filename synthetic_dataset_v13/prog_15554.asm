; DESCRIPTION: Draws a red rectangle at (280, 32) with width 55 and height 97.
; PLAN: r0=280(x), r1=32(y), r2=55(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 32
LDI r2, 55
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
