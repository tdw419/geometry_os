; DESCRIPTION: Draws a cyan rectangle at (307, 69) with width 85 and height 45.
; PLAN: r0=307(x), r1=69(y), r2=85(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 69
LDI r2, 85
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
