; DESCRIPTION: Draws a yellow rectangle at (283, 107) with width 27 and height 18.
; PLAN: r0=283(x), r1=107(y), r2=27(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 107
LDI r2, 27
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
