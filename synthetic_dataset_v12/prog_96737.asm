; DESCRIPTION: Draws a yellow rectangle at (298, 131) with width 60 and height 106.
; PLAN: r0=298(x), r1=131(y), r2=60(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 131
LDI r2, 60
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
