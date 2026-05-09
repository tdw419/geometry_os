; DESCRIPTION: Draws a cyan rectangle at (261, 103) with width 48 and height 108.
; PLAN: r0=261(x), r1=103(y), r2=48(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 103
LDI r2, 48
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
