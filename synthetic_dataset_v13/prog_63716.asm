; DESCRIPTION: Draws a yellow rectangle at (242, 18) with width 40 and height 19.
; PLAN: r0=242(x), r1=18(y), r2=40(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 18
LDI r2, 40
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
