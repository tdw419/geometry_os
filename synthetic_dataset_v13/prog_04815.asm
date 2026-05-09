; DESCRIPTION: Draws a yellow rectangle at (275, 107) with width 108 and height 77.
; PLAN: r0=275(x), r1=107(y), r2=108(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 107
LDI r2, 108
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
