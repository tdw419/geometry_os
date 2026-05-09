; DESCRIPTION: Draws a green rectangle at (154, 71) with width 62 and height 79.
; PLAN: r0=154(x), r1=71(y), r2=62(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 71
LDI r2, 62
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
