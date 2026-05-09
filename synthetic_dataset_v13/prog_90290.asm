; DESCRIPTION: Draws a yellow rectangle at (354, 21) with width 61 and height 105.
; PLAN: r0=354(x), r1=21(y), r2=61(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 21
LDI r2, 61
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
