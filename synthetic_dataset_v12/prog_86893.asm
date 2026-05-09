; DESCRIPTION: Draws a yellow rectangle at (446, 156) with width 50 and height 47.
; PLAN: r0=446(x), r1=156(y), r2=50(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 156
LDI r2, 50
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
