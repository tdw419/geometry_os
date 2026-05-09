; DESCRIPTION: Draws a green rectangle at (354, 47) with width 72 and height 77.
; PLAN: r0=354(x), r1=47(y), r2=72(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 47
LDI r2, 72
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
