; DESCRIPTION: Draws a cyan rectangle at (174, 69) with width 97 and height 50.
; PLAN: r0=174(x), r1=69(y), r2=97(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 69
LDI r2, 97
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
