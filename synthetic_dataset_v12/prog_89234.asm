; DESCRIPTION: Draws a cyan rectangle at (36, 192) with width 54 and height 32.
; PLAN: r0=36(x), r1=192(y), r2=54(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 192
LDI r2, 54
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
