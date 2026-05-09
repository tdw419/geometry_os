; DESCRIPTION: Draws a red rectangle at (283, 25) with width 57 and height 27.
; PLAN: r0=283(x), r1=25(y), r2=57(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 25
LDI r2, 57
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
