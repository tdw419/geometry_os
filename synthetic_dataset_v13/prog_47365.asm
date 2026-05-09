; DESCRIPTION: Draws a yellow rectangle at (367, 6) with width 16 and height 39.
; PLAN: r0=367(x), r1=6(y), r2=16(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 6
LDI r2, 16
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
