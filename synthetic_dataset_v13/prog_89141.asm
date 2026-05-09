; DESCRIPTION: Draws a cyan rectangle at (419, 124) with width 18 and height 34.
; PLAN: r0=419(x), r1=124(y), r2=18(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 124
LDI r2, 18
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
