; DESCRIPTION: Draws a cyan rectangle at (201, 42) with width 108 and height 87.
; PLAN: r0=201(x), r1=42(y), r2=108(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 42
LDI r2, 108
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
