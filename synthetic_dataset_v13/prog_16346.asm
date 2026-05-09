; DESCRIPTION: Draws a cyan rectangle at (409, 70) with width 30 and height 34.
; PLAN: r0=409(x), r1=70(y), r2=30(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 70
LDI r2, 30
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
