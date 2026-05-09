; DESCRIPTION: Draws a orange rectangle at (72, 59) with width 91 and height 61.
; PLAN: r0=72(x), r1=59(y), r2=91(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 59
LDI r2, 91
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
