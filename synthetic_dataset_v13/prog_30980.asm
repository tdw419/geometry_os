; DESCRIPTION: Draws a yellow rectangle at (215, 111) with width 86 and height 99.
; PLAN: r0=215(x), r1=111(y), r2=86(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 111
LDI r2, 86
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
