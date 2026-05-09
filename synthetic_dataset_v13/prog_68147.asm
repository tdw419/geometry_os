; DESCRIPTION: Draws a cyan rectangle at (21, 61) with width 33 and height 110.
; PLAN: r0=21(x), r1=61(y), r2=33(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 61
LDI r2, 33
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
