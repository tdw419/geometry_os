; DESCRIPTION: Draws a cyan rectangle at (12, 80) with width 12 and height 52.
; PLAN: r0=12(x), r1=80(y), r2=12(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 80
LDI r2, 12
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
