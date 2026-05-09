; DESCRIPTION: Draws a yellow rectangle at (80, 143) with width 39 and height 70.
; PLAN: r0=80(x), r1=143(y), r2=39(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 143
LDI r2, 39
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
