; DESCRIPTION: Draws a cyan rectangle at (87, 48) with width 51 and height 49.
; PLAN: r0=87(x), r1=48(y), r2=51(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 48
LDI r2, 51
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
