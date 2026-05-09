; DESCRIPTION: Draws a cyan rectangle at (338, 124) with width 82 and height 98.
; PLAN: r0=338(x), r1=124(y), r2=82(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 124
LDI r2, 82
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
