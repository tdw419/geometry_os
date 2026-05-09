; DESCRIPTION: Draws a cyan rectangle at (18, 70) with width 69 and height 24.
; PLAN: r0=18(x), r1=70(y), r2=69(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 70
LDI r2, 69
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
