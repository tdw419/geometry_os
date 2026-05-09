; DESCRIPTION: Draws a black rectangle at (345, 205) with width 58 and height 48.
; PLAN: r0=345(x), r1=205(y), r2=58(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 205
LDI r2, 58
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
