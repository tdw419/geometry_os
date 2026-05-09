; DESCRIPTION: Draws a cyan rectangle at (412, 77) with width 91 and height 68.
; PLAN: r0=412(x), r1=77(y), r2=91(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 77
LDI r2, 91
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
