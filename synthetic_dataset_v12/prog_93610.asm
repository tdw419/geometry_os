; DESCRIPTION: Draws a yellow rectangle at (207, 50) with width 98 and height 48.
; PLAN: r0=207(x), r1=50(y), r2=98(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 98
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
