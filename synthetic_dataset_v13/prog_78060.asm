; DESCRIPTION: Draws a yellow rectangle at (279, 195) with width 48 and height 28.
; PLAN: r0=279(x), r1=195(y), r2=48(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 195
LDI r2, 48
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
