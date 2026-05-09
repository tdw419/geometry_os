; DESCRIPTION: Draws a yellow rectangle at (392, 12) with width 102 and height 111.
; PLAN: r0=392(x), r1=12(y), r2=102(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 12
LDI r2, 102
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
