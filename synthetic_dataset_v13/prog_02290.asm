; DESCRIPTION: Draws a cyan rectangle at (112, 38) with width 34 and height 25.
; PLAN: r0=112(x), r1=38(y), r2=34(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 38
LDI r2, 34
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
