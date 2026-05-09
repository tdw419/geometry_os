; DESCRIPTION: Draws a green rectangle at (298, 111) with width 44 and height 68.
; PLAN: r0=298(x), r1=111(y), r2=44(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 111
LDI r2, 44
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
