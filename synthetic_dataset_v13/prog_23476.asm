; DESCRIPTION: Draws a yellow rectangle at (126, 39) with width 13 and height 87.
; PLAN: r0=126(x), r1=39(y), r2=13(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 39
LDI r2, 13
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
