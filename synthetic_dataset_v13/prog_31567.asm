; DESCRIPTION: Draws a cyan rectangle at (247, 68) with width 79 and height 102.
; PLAN: r0=247(x), r1=68(y), r2=79(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 68
LDI r2, 79
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
