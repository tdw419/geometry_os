; DESCRIPTION: Draws a cyan rectangle at (438, 44) with width 33 and height 36.
; PLAN: r0=438(x), r1=44(y), r2=33(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 44
LDI r2, 33
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
