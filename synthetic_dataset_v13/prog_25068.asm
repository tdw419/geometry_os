; DESCRIPTION: Draws a cyan rectangle at (337, 23) with width 60 and height 99.
; PLAN: r0=337(x), r1=23(y), r2=60(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 23
LDI r2, 60
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
