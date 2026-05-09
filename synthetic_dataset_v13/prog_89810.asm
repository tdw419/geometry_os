; DESCRIPTION: Draws a cyan rectangle at (321, 45) with width 57 and height 20.
; PLAN: r0=321(x), r1=45(y), r2=57(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 45
LDI r2, 57
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
