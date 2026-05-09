; DESCRIPTION: Draws a yellow rectangle at (385, 48) with width 44 and height 47.
; PLAN: r0=385(x), r1=48(y), r2=44(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 48
LDI r2, 44
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
