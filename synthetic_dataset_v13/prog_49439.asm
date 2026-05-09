; DESCRIPTION: Draws a cyan rectangle at (409, 89) with width 98 and height 32.
; PLAN: r0=409(x), r1=89(y), r2=98(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 89
LDI r2, 98
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
