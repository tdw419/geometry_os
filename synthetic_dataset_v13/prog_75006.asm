; DESCRIPTION: Draws a cyan rectangle at (117, 21) with width 105 and height 60.
; PLAN: r0=117(x), r1=21(y), r2=105(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 21
LDI r2, 105
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
