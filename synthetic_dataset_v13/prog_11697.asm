; DESCRIPTION: Draws a cyan rectangle at (211, 94) with width 68 and height 91.
; PLAN: r0=211(x), r1=94(y), r2=68(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 94
LDI r2, 68
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
