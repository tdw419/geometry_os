; DESCRIPTION: Draws a black rectangle at (277, 39) with width 26 and height 64.
; PLAN: r0=277(x), r1=39(y), r2=26(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 39
LDI r2, 26
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
