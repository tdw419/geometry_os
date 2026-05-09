; DESCRIPTION: Draws a cyan rectangle at (210, 125) with width 78 and height 40.
; PLAN: r0=210(x), r1=125(y), r2=78(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 125
LDI r2, 78
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
