; DESCRIPTION: Draws a cyan rectangle at (200, 74) with width 38 and height 20.
; PLAN: r0=200(x), r1=74(y), r2=38(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 74
LDI r2, 38
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
