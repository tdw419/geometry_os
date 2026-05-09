; DESCRIPTION: Draws a yellow rectangle at (409, 237) with width 93 and height 11.
; PLAN: r0=409(x), r1=237(y), r2=93(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 237
LDI r2, 93
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
