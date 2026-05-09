; DESCRIPTION: Draws a cyan rectangle at (307, 158) with width 75 and height 27.
; PLAN: r0=307(x), r1=158(y), r2=75(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 158
LDI r2, 75
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
