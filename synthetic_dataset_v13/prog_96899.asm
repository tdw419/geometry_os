; DESCRIPTION: Draws a orange rectangle at (269, 34) with width 110 and height 111.
; PLAN: r0=269(x), r1=34(y), r2=110(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 34
LDI r2, 110
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
