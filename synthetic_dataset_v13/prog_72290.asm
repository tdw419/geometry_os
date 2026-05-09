; DESCRIPTION: Draws a cyan rectangle at (123, 81) with width 45 and height 63.
; PLAN: r0=123(x), r1=81(y), r2=45(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 81
LDI r2, 45
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
