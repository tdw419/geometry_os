; DESCRIPTION: Draws a cyan rectangle at (61, 80) with width 102 and height 85.
; PLAN: r0=61(x), r1=80(y), r2=102(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 80
LDI r2, 102
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
