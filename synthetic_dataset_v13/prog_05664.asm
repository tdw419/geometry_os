; DESCRIPTION: Draws a green rectangle at (275, 45) with width 72 and height 57.
; PLAN: r0=275(x), r1=45(y), r2=72(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 45
LDI r2, 72
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
