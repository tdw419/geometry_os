; DESCRIPTION: Draws a orange rectangle at (175, 194) with width 94 and height 34.
; PLAN: r0=175(x), r1=194(y), r2=94(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 194
LDI r2, 94
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
