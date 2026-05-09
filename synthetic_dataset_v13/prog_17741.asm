; DESCRIPTION: Draws a red rectangle at (208, 18) with width 37 and height 102.
; PLAN: r0=208(x), r1=18(y), r2=37(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 18
LDI r2, 37
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
