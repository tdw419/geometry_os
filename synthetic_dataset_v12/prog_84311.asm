; DESCRIPTION: Draws a cyan rectangle at (269, 95) with width 11 and height 63.
; PLAN: r0=269(x), r1=95(y), r2=11(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 95
LDI r2, 11
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
