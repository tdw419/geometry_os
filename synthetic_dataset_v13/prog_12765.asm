; DESCRIPTION: Draws a cyan rectangle at (99, 85) with width 109 and height 28.
; PLAN: r0=99(x), r1=85(y), r2=109(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 85
LDI r2, 109
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
