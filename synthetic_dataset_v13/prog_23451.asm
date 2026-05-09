; DESCRIPTION: Draws a cyan rectangle at (164, 69) with width 88 and height 103.
; PLAN: r0=164(x), r1=69(y), r2=88(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 69
LDI r2, 88
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
