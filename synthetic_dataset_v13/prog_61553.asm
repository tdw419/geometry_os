; DESCRIPTION: Draws a cyan rectangle at (44, 160) with width 36 and height 40.
; PLAN: r0=44(x), r1=160(y), r2=36(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 160
LDI r2, 36
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
