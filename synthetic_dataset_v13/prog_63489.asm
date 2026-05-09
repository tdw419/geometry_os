; DESCRIPTION: Draws a cyan rectangle at (64, 80) with width 114 and height 111.
; PLAN: r0=64(x), r1=80(y), r2=114(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 80
LDI r2, 114
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
