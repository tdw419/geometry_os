; DESCRIPTION: Draws a orange rectangle at (406, 0) with width 44 and height 64.
; PLAN: r0=406(x), r1=0(y), r2=44(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 0
LDI r2, 44
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
