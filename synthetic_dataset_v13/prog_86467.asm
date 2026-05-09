; DESCRIPTION: Draws a cyan rectangle at (247, 147) with width 120 and height 73.
; PLAN: r0=247(x), r1=147(y), r2=120(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 147
LDI r2, 120
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
