; DESCRIPTION: Draws a cyan rectangle at (18, 60) with width 88 and height 111.
; PLAN: r0=18(x), r1=60(y), r2=88(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 60
LDI r2, 88
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
