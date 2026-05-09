; DESCRIPTION: Draws a black rectangle at (386, 96) with width 75 and height 30.
; PLAN: r0=386(x), r1=96(y), r2=75(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 96
LDI r2, 75
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
