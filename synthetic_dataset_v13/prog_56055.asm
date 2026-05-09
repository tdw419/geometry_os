; DESCRIPTION: Draws a cyan rectangle at (73, 159) with width 100 and height 42.
; PLAN: r0=73(x), r1=159(y), r2=100(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 159
LDI r2, 100
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
