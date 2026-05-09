; DESCRIPTION: Draws a cyan rectangle at (233, 153) with width 42 and height 43.
; PLAN: r0=233(x), r1=153(y), r2=42(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 153
LDI r2, 42
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
