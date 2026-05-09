; DESCRIPTION: Draws a red rectangle at (321, 8) with width 27 and height 59.
; PLAN: r0=321(x), r1=8(y), r2=27(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 8
LDI r2, 27
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
