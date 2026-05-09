; DESCRIPTION: Draws a cyan rectangle at (20, 226) with width 58 and height 27.
; PLAN: r0=20(x), r1=226(y), r2=58(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 226
LDI r2, 58
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
