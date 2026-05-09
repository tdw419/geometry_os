; DESCRIPTION: Draws a cyan rectangle at (386, 33) with width 41 and height 69.
; PLAN: r0=386(x), r1=33(y), r2=41(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 33
LDI r2, 41
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
