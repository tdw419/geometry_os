; DESCRIPTION: Draws a orange rectangle at (410, 73) with width 78 and height 96.
; PLAN: r0=410(x), r1=73(y), r2=78(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 73
LDI r2, 78
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
