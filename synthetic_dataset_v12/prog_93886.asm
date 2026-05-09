; DESCRIPTION: Draws a cyan rectangle at (414, 92) with width 23 and height 68.
; PLAN: r0=414(x), r1=92(y), r2=23(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 92
LDI r2, 23
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
