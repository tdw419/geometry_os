; DESCRIPTION: Draws a green rectangle at (367, 131) with width 18 and height 90.
; PLAN: r0=367(x), r1=131(y), r2=18(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 131
LDI r2, 18
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
