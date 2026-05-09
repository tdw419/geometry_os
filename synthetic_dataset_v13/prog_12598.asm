; DESCRIPTION: Draws a red rectangle at (405, 1) with width 59 and height 28.
; PLAN: r0=405(x), r1=1(y), r2=59(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 1
LDI r2, 59
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
