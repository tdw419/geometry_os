; DESCRIPTION: Draws a cyan rectangle at (75, 138) with width 50 and height 101.
; PLAN: r0=75(x), r1=138(y), r2=50(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 138
LDI r2, 50
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
