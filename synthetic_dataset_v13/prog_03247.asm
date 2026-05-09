; DESCRIPTION: Draws a cyan rectangle at (225, 141) with width 40 and height 14.
; PLAN: r0=225(x), r1=141(y), r2=40(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 141
LDI r2, 40
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
