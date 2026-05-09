; DESCRIPTION: Draws a orange rectangle at (215, 65) with width 33 and height 52.
; PLAN: r0=215(x), r1=65(y), r2=33(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 65
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
