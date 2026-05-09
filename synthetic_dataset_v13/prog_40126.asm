; DESCRIPTION: Draws a cyan rectangle at (220, 100) with width 91 and height 68.
; PLAN: r0=220(x), r1=100(y), r2=91(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 100
LDI r2, 91
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
