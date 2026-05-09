; DESCRIPTION: Draws a cyan rectangle at (79, 1) with width 108 and height 50.
; PLAN: r0=79(x), r1=1(y), r2=108(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 1
LDI r2, 108
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
