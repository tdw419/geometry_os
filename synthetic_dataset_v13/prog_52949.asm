; DESCRIPTION: Draws a cyan rectangle at (303, 23) with width 83 and height 100.
; PLAN: r0=303(x), r1=23(y), r2=83(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 23
LDI r2, 83
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
