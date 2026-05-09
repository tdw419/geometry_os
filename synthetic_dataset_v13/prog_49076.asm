; DESCRIPTION: Draws a yellow rectangle at (271, 116) with width 72 and height 27.
; PLAN: r0=271(x), r1=116(y), r2=72(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 116
LDI r2, 72
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
