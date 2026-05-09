; DESCRIPTION: Draws a cyan rectangle at (327, 200) with width 76 and height 36.
; PLAN: r0=327(x), r1=200(y), r2=76(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 200
LDI r2, 76
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
