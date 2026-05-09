; DESCRIPTION: Draws a orange rectangle at (255, 161) with width 47 and height 87.
; PLAN: r0=255(x), r1=161(y), r2=47(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 161
LDI r2, 47
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
