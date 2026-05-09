; DESCRIPTION: Draws a cyan rectangle at (187, 102) with width 46 and height 26.
; PLAN: r0=187(x), r1=102(y), r2=46(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 102
LDI r2, 46
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
