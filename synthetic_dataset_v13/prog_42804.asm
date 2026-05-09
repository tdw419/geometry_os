; DESCRIPTION: Draws a yellow rectangle at (206, 78) with width 48 and height 46.
; PLAN: r0=206(x), r1=78(y), r2=48(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 78
LDI r2, 48
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
