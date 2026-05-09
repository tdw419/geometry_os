; DESCRIPTION: Draws a cyan rectangle at (91, 57) with width 99 and height 70.
; PLAN: r0=91(x), r1=57(y), r2=99(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 57
LDI r2, 99
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
