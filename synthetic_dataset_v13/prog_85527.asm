; DESCRIPTION: Draws a cyan rectangle at (25, 75) with width 91 and height 40.
; PLAN: r0=25(x), r1=75(y), r2=91(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 75
LDI r2, 91
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
