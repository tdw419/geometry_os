; DESCRIPTION: Draws a cyan rectangle at (317, 178) with width 19 and height 20.
; PLAN: r0=317(x), r1=178(y), r2=19(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 178
LDI r2, 19
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
