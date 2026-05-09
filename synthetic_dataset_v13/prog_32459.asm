; DESCRIPTION: Draws a yellow rectangle at (199, 59) with width 27 and height 19.
; PLAN: r0=199(x), r1=59(y), r2=27(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 59
LDI r2, 27
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
