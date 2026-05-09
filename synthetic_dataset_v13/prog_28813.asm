; DESCRIPTION: Draws a yellow rectangle at (301, 47) with width 25 and height 59.
; PLAN: r0=301(x), r1=47(y), r2=25(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 47
LDI r2, 25
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
