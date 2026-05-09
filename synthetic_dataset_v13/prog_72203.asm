; DESCRIPTION: Draws a green rectangle at (450, 133) with width 42 and height 43.
; PLAN: r0=450(x), r1=133(y), r2=42(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 133
LDI r2, 42
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
