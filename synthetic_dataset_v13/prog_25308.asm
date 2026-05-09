; DESCRIPTION: Draws a yellow rectangle at (380, 209) with width 64 and height 18.
; PLAN: r0=380(x), r1=209(y), r2=64(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 209
LDI r2, 64
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
