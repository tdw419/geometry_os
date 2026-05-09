; DESCRIPTION: Draws a yellow rectangle at (255, 143) with width 10 and height 84.
; PLAN: r0=255(x), r1=143(y), r2=10(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 143
LDI r2, 10
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
