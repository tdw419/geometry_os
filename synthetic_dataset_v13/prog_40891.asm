; DESCRIPTION: Draws a yellow rectangle at (470, 30) with width 20 and height 82.
; PLAN: r0=470(x), r1=30(y), r2=20(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 30
LDI r2, 20
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
