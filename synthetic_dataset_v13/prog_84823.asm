; DESCRIPTION: Draws a cyan rectangle at (290, 39) with width 23 and height 97.
; PLAN: r0=290(x), r1=39(y), r2=23(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 39
LDI r2, 23
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
