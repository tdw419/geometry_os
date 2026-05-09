; DESCRIPTION: Draws a black rectangle at (269, 44) with width 74 and height 61.
; PLAN: r0=269(x), r1=44(y), r2=74(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 44
LDI r2, 74
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
