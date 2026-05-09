; DESCRIPTION: Draws a yellow rectangle at (219, 177) with width 18 and height 27.
; PLAN: r0=219(x), r1=177(y), r2=18(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 177
LDI r2, 18
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
