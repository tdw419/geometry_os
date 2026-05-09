; DESCRIPTION: Draws a cyan rectangle at (217, 38) with width 19 and height 56.
; PLAN: r0=217(x), r1=38(y), r2=19(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 38
LDI r2, 19
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
