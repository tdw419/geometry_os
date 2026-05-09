; DESCRIPTION: Draws a cyan rectangle at (412, 2) with width 75 and height 91.
; PLAN: r0=412(x), r1=2(y), r2=75(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 2
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
