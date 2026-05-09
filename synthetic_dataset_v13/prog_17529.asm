; DESCRIPTION: Draws a cyan rectangle at (334, 25) with width 94 and height 27.
; PLAN: r0=334(x), r1=25(y), r2=94(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 25
LDI r2, 94
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
