; DESCRIPTION: Draws a cyan rectangle at (12, 32) with width 33 and height 33.
; PLAN: r0=12(x), r1=32(y), r2=33(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 32
LDI r2, 33
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
