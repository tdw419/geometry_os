; DESCRIPTION: Draws a cyan rectangle at (399, 87) with width 49 and height 120.
; PLAN: r0=399(x), r1=87(y), r2=49(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 87
LDI r2, 49
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
