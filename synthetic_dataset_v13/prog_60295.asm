; DESCRIPTION: Draws a cyan rectangle at (53, 32) with width 52 and height 46.
; PLAN: r0=53(x), r1=32(y), r2=52(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 32
LDI r2, 52
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
