; DESCRIPTION: Draws a yellow rectangle at (281, 151) with width 56 and height 97.
; PLAN: r0=281(x), r1=151(y), r2=56(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 151
LDI r2, 56
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
