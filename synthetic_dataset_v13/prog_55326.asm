; DESCRIPTION: Draws a magenta rectangle at (298, 186) with width 44 and height 30.
; PLAN: r0=298(x), r1=186(y), r2=44(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 186
LDI r2, 44
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
