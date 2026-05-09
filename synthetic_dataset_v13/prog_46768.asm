; DESCRIPTION: Draws a orange rectangle at (39, 130) with width 71 and height 57.
; PLAN: r0=39(x), r1=130(y), r2=71(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 130
LDI r2, 71
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
