; DESCRIPTION: Draws a cyan rectangle at (303, 34) with width 64 and height 89.
; PLAN: r0=303(x), r1=34(y), r2=64(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 34
LDI r2, 64
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
