; DESCRIPTION: Draws a cyan rectangle at (76, 66) with width 50 and height 44.
; PLAN: r0=76(x), r1=66(y), r2=50(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 66
LDI r2, 50
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
