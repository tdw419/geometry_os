; DESCRIPTION: Draws a cyan rectangle at (406, 75) with width 39 and height 120.
; PLAN: r0=406(x), r1=75(y), r2=39(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 75
LDI r2, 39
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
