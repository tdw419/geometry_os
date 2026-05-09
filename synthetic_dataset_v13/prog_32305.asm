; DESCRIPTION: Draws a yellow rectangle at (419, 187) with width 21 and height 12.
; PLAN: r0=419(x), r1=187(y), r2=21(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 187
LDI r2, 21
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
