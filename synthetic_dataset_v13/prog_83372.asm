; DESCRIPTION: Draws a red rectangle at (127, 7) with width 27 and height 119.
; PLAN: r0=127(x), r1=7(y), r2=27(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 7
LDI r2, 27
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
