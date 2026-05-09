; DESCRIPTION: Draws a cyan rectangle at (433, 89) with width 24 and height 45.
; PLAN: r0=433(x), r1=89(y), r2=24(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 89
LDI r2, 24
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
