; DESCRIPTION: Draws a cyan rectangle at (466, 48) with width 27 and height 22.
; PLAN: r0=466(x), r1=48(y), r2=27(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 48
LDI r2, 27
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
