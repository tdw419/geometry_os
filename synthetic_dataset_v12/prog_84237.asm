; DESCRIPTION: Draws a yellow rectangle at (172, 33) with width 111 and height 31.
; PLAN: r0=172(x), r1=33(y), r2=111(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 33
LDI r2, 111
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
