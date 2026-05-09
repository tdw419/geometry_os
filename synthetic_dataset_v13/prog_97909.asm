; DESCRIPTION: Draws a black rectangle at (386, 86) with width 90 and height 12.
; PLAN: r0=386(x), r1=86(y), r2=90(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 86
LDI r2, 90
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
