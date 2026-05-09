; DESCRIPTION: Draws a cyan rectangle at (416, 25) with width 36 and height 29.
; PLAN: r0=416(x), r1=25(y), r2=36(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 25
LDI r2, 36
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
