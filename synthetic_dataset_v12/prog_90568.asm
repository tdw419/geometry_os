; DESCRIPTION: Draws a cyan rectangle at (128, 53) with width 110 and height 68.
; PLAN: r0=128(x), r1=53(y), r2=110(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 53
LDI r2, 110
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
