; DESCRIPTION: Draws a cyan rectangle at (10, 217) with width 42 and height 25.
; PLAN: r0=10(x), r1=217(y), r2=42(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 217
LDI r2, 42
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
