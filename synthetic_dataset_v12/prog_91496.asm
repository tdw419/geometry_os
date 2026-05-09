; DESCRIPTION: Draws a cyan rectangle at (345, 74) with width 64 and height 46.
; PLAN: r0=345(x), r1=74(y), r2=64(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 74
LDI r2, 64
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
