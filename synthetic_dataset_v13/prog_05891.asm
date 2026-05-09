; DESCRIPTION: Draws a green rectangle at (71, 107) with width 108 and height 87.
; PLAN: r0=71(x), r1=107(y), r2=108(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 107
LDI r2, 108
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
