; DESCRIPTION: Draws a cyan rectangle at (388, 135) with width 37 and height 93.
; PLAN: r0=388(x), r1=135(y), r2=37(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 135
LDI r2, 37
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
