; DESCRIPTION: Draws a cyan rectangle at (267, 12) with width 40 and height 68.
; PLAN: r0=267(x), r1=12(y), r2=40(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 12
LDI r2, 40
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
