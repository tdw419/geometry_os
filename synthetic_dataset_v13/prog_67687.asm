; DESCRIPTION: Draws a cyan rectangle at (83, 93) with width 34 and height 87.
; PLAN: r0=83(x), r1=93(y), r2=34(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 93
LDI r2, 34
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
