; DESCRIPTION: Draws a cyan rectangle at (95, 45) with width 68 and height 38.
; PLAN: r0=95(x), r1=45(y), r2=68(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 45
LDI r2, 68
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
