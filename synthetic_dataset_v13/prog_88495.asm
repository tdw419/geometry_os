; DESCRIPTION: Draws a orange rectangle at (259, 59) with width 82 and height 86.
; PLAN: r0=259(x), r1=59(y), r2=82(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 59
LDI r2, 82
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
