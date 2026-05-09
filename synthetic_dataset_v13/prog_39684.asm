; DESCRIPTION: Draws a cyan rectangle at (42, 145) with width 119 and height 82.
; PLAN: r0=42(x), r1=145(y), r2=119(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 145
LDI r2, 119
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
