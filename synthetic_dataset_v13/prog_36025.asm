; DESCRIPTION: Draws a blue rectangle at (395, 186) with width 38 and height 39.
; PLAN: r0=395(x), r1=186(y), r2=38(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 186
LDI r2, 38
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
