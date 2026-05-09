; DESCRIPTION: Draws a cyan rectangle at (290, 66) with width 23 and height 73.
; PLAN: r0=290(x), r1=66(y), r2=23(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 66
LDI r2, 23
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
