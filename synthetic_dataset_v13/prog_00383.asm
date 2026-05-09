; DESCRIPTION: Draws a black rectangle at (405, 223) with width 75 and height 17.
; PLAN: r0=405(x), r1=223(y), r2=75(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 223
LDI r2, 75
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
