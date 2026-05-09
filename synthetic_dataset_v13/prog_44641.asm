; DESCRIPTION: Draws a yellow rectangle at (388, 98) with width 64 and height 34.
; PLAN: r0=388(x), r1=98(y), r2=64(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 98
LDI r2, 64
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
