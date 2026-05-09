; DESCRIPTION: Draws a cyan rectangle at (88, 138) with width 42 and height 54.
; PLAN: r0=88(x), r1=138(y), r2=42(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 138
LDI r2, 42
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
