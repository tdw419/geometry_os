; DESCRIPTION: Draws a red rectangle at (243, 9) with width 12 and height 33.
; PLAN: r0=243(x), r1=9(y), r2=12(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 9
LDI r2, 12
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
