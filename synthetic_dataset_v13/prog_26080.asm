; DESCRIPTION: Draws a cyan rectangle at (312, 141) with width 38 and height 18.
; PLAN: r0=312(x), r1=141(y), r2=38(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 141
LDI r2, 38
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
