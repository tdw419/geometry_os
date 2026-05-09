; DESCRIPTION: Draws a cyan rectangle at (180, 200) with width 110 and height 43.
; PLAN: r0=180(x), r1=200(y), r2=110(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 200
LDI r2, 110
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
