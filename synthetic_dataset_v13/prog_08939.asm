; DESCRIPTION: Draws a red rectangle at (243, 112) with width 11 and height 119.
; PLAN: r0=243(x), r1=112(y), r2=11(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 112
LDI r2, 11
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
