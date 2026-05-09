; DESCRIPTION: Draws a cyan rectangle at (121, 112) with width 25 and height 70.
; PLAN: r0=121(x), r1=112(y), r2=25(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 112
LDI r2, 25
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
