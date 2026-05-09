; DESCRIPTION: Draws a cyan rectangle at (42, 50) with width 84 and height 68.
; PLAN: r0=42(x), r1=50(y), r2=84(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 50
LDI r2, 84
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
