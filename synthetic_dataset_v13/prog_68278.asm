; DESCRIPTION: Draws a green rectangle at (187, 126) with width 12 and height 92.
; PLAN: r0=187(x), r1=126(y), r2=12(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 126
LDI r2, 12
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
