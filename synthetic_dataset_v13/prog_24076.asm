; DESCRIPTION: Draws a green rectangle at (301, 120) with width 39 and height 120.
; PLAN: r0=301(x), r1=120(y), r2=39(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 120
LDI r2, 39
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
