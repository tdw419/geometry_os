; DESCRIPTION: Draws a cyan rectangle at (23, 87) with width 75 and height 87.
; PLAN: r0=23(x), r1=87(y), r2=75(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 87
LDI r2, 75
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
