; DESCRIPTION: Draws a cyan rectangle at (332, 210) with width 27 and height 13.
; PLAN: r0=332(x), r1=210(y), r2=27(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 210
LDI r2, 27
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
