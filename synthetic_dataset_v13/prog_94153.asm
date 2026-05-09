; DESCRIPTION: Draws a yellow rectangle at (29, 71) with width 32 and height 70.
; PLAN: r0=29(x), r1=71(y), r2=32(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 71
LDI r2, 32
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
