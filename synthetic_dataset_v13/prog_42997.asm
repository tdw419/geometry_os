; DESCRIPTION: Draws a cyan rectangle at (388, 44) with width 83 and height 86.
; PLAN: r0=388(x), r1=44(y), r2=83(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 44
LDI r2, 83
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
