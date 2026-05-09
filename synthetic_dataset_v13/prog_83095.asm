; DESCRIPTION: Draws a cyan rectangle at (258, 73) with width 112 and height 61.
; PLAN: r0=258(x), r1=73(y), r2=112(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 73
LDI r2, 112
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
