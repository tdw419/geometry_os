; DESCRIPTION: Draws a cyan rectangle at (199, 32) with width 99 and height 97.
; PLAN: r0=199(x), r1=32(y), r2=99(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 32
LDI r2, 99
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
