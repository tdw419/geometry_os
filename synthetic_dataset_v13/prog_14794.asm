; DESCRIPTION: Draws a orange rectangle at (214, 101) with width 93 and height 59.
; PLAN: r0=214(x), r1=101(y), r2=93(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 101
LDI r2, 93
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
