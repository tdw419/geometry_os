; DESCRIPTION: Draws a green rectangle at (103, 213) with width 90 and height 20.
; PLAN: r0=103(x), r1=213(y), r2=90(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 213
LDI r2, 90
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
