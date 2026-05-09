; DESCRIPTION: Draws a red rectangle at (288, 46) with width 80 and height 117.
; PLAN: r0=288(x), r1=46(y), r2=80(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 46
LDI r2, 80
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
