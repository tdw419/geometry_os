; DESCRIPTION: Draws a yellow rectangle at (350, 39) with width 32 and height 34.
; PLAN: r0=350(x), r1=39(y), r2=32(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 39
LDI r2, 32
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
