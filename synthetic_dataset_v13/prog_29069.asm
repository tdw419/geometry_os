; DESCRIPTION: Draws a cyan rectangle at (163, 56) with width 70 and height 85.
; PLAN: r0=163(x), r1=56(y), r2=70(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 56
LDI r2, 70
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
