; DESCRIPTION: Draws a yellow rectangle at (12, 161) with width 58 and height 42.
; PLAN: r0=12(x), r1=161(y), r2=58(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 161
LDI r2, 58
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
