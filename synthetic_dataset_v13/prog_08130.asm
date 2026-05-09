; DESCRIPTION: Draws a cyan rectangle at (184, 177) with width 102 and height 72.
; PLAN: r0=184(x), r1=177(y), r2=102(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 177
LDI r2, 102
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
