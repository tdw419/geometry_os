; DESCRIPTION: Draws a green rectangle at (450, 37) with width 45 and height 39.
; PLAN: r0=450(x), r1=37(y), r2=45(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 37
LDI r2, 45
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
