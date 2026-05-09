; DESCRIPTION: Draws a cyan rectangle at (487, 14) with width 25 and height 33.
; PLAN: r0=487(x), r1=14(y), r2=25(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 14
LDI r2, 25
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
