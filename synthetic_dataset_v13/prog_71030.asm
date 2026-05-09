; DESCRIPTION: Draws a cyan rectangle at (388, 80) with width 33 and height 30.
; PLAN: r0=388(x), r1=80(y), r2=33(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 80
LDI r2, 33
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
