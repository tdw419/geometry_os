; DESCRIPTION: Draws a cyan rectangle at (138, 220) with width 58 and height 35.
; PLAN: r0=138(x), r1=220(y), r2=58(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 220
LDI r2, 58
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
