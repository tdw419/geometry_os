; DESCRIPTION: Draws a cyan rectangle at (125, 31) with width 39 and height 104.
; PLAN: r0=125(x), r1=31(y), r2=39(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 31
LDI r2, 39
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
