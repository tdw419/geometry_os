; DESCRIPTION: Draws a yellow rectangle at (295, 94) with width 37 and height 109.
; PLAN: r0=295(x), r1=94(y), r2=37(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 94
LDI r2, 37
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
