; DESCRIPTION: Draws a cyan rectangle at (336, 125) with width 111 and height 13.
; PLAN: r0=336(x), r1=125(y), r2=111(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 125
LDI r2, 111
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
