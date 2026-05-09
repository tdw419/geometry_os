; DESCRIPTION: Draws a white rectangle at (386, 118) with width 10 and height 96.
; PLAN: r0=386(x), r1=118(y), r2=10(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 118
LDI r2, 10
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
