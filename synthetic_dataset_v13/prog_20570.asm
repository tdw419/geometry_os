; DESCRIPTION: Draws a cyan rectangle at (47, 108) with width 40 and height 57.
; PLAN: r0=47(x), r1=108(y), r2=40(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 108
LDI r2, 40
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
