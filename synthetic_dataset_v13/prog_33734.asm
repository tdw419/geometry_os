; DESCRIPTION: Draws a orange rectangle at (206, 70) with width 58 and height 21.
; PLAN: r0=206(x), r1=70(y), r2=58(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 70
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
