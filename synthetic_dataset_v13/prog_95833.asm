; DESCRIPTION: Draws a cyan rectangle at (85, 66) with width 34 and height 16.
; PLAN: r0=85(x), r1=66(y), r2=34(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 66
LDI r2, 34
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
