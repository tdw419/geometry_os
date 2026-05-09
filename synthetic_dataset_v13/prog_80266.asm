; DESCRIPTION: Draws a yellow rectangle at (193, 77) with width 54 and height 61.
; PLAN: r0=193(x), r1=77(y), r2=54(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 77
LDI r2, 54
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
