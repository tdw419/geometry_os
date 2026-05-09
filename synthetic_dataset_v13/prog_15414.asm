; DESCRIPTION: Draws a cyan rectangle at (393, 9) with width 47 and height 108.
; PLAN: r0=393(x), r1=9(y), r2=47(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 9
LDI r2, 47
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
