; DESCRIPTION: Draws a orange rectangle at (305, 109) with width 70 and height 68.
; PLAN: r0=305(x), r1=109(y), r2=70(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 109
LDI r2, 70
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
