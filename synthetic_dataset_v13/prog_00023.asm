; DESCRIPTION: Draws a green rectangle at (73, 30) with width 48 and height 50.
; PLAN: r0=73(x), r1=30(y), r2=48(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 30
LDI r2, 48
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
