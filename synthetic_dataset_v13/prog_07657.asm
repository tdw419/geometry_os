; DESCRIPTION: Draws a orange rectangle at (271, 71) with width 47 and height 38.
; PLAN: r0=271(x), r1=71(y), r2=47(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 71
LDI r2, 47
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
