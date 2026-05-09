; DESCRIPTION: Draws a black rectangle at (48, 180) with width 106 and height 46.
; PLAN: r0=48(x), r1=180(y), r2=106(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 180
LDI r2, 106
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
