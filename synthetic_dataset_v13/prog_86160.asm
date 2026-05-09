; DESCRIPTION: Draws a red rectangle at (426, 41) with width 27 and height 48.
; PLAN: r0=426(x), r1=41(y), r2=27(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 41
LDI r2, 27
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
