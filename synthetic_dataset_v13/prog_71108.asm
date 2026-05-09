; DESCRIPTION: Draws a red rectangle at (354, 64) with width 91 and height 110.
; PLAN: r0=354(x), r1=64(y), r2=91(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 64
LDI r2, 91
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
