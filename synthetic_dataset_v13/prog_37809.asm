; DESCRIPTION: Draws a green rectangle at (289, 146) with width 46 and height 98.
; PLAN: r0=289(x), r1=146(y), r2=46(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 146
LDI r2, 46
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
