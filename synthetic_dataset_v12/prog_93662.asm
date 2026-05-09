; DESCRIPTION: Draws a cyan rectangle at (436, 87) with width 19 and height 95.
; PLAN: r0=436(x), r1=87(y), r2=19(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 87
LDI r2, 19
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
