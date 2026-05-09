; DESCRIPTION: Draws a green rectangle at (335, 160) with width 45 and height 60.
; PLAN: r0=335(x), r1=160(y), r2=45(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 160
LDI r2, 45
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
