; DESCRIPTION: Draws a cyan rectangle at (387, 6) with width 76 and height 44.
; PLAN: r0=387(x), r1=6(y), r2=76(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 6
LDI r2, 76
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
