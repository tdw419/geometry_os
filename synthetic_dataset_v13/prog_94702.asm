; DESCRIPTION: Draws a cyan rectangle at (53, 64) with width 68 and height 102.
; PLAN: r0=53(x), r1=64(y), r2=68(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 64
LDI r2, 68
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
