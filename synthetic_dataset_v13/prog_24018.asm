; DESCRIPTION: Draws a red rectangle at (234, 107) with width 56 and height 13.
; PLAN: r0=234(x), r1=107(y), r2=56(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 107
LDI r2, 56
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
