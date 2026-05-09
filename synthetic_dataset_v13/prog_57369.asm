; DESCRIPTION: Draws a green rectangle at (77, 128) with width 109 and height 59.
; PLAN: r0=77(x), r1=128(y), r2=109(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 128
LDI r2, 109
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
