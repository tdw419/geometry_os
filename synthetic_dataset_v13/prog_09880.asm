; DESCRIPTION: Draws a cyan rectangle at (58, 40) with width 111 and height 114.
; PLAN: r0=58(x), r1=40(y), r2=111(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 40
LDI r2, 111
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
