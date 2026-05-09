; DESCRIPTION: Draws a cyan rectangle at (56, 62) with width 99 and height 32.
; PLAN: r0=56(x), r1=62(y), r2=99(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 62
LDI r2, 99
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
