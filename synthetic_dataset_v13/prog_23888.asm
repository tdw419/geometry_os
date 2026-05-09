; DESCRIPTION: Draws a cyan rectangle at (309, 164) with width 20 and height 27.
; PLAN: r0=309(x), r1=164(y), r2=20(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 164
LDI r2, 20
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
