; DESCRIPTION: Draws a orange rectangle at (151, 59) with width 62 and height 48.
; PLAN: r0=151(x), r1=59(y), r2=62(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 59
LDI r2, 62
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
