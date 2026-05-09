; DESCRIPTION: Draws a red rectangle at (243, 143) with width 99 and height 38.
; PLAN: r0=243(x), r1=143(y), r2=99(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 143
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
