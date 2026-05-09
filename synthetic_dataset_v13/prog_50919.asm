; DESCRIPTION: Draws a cyan rectangle at (355, 103) with width 91 and height 94.
; PLAN: r0=355(x), r1=103(y), r2=91(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 103
LDI r2, 91
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
