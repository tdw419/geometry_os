; DESCRIPTION: Draws a black rectangle at (330, 77) with width 59 and height 68.
; PLAN: r0=330(x), r1=77(y), r2=59(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 77
LDI r2, 59
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
