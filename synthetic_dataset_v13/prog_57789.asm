; DESCRIPTION: Draws a orange rectangle at (146, 161) with width 69 and height 20.
; PLAN: r0=146(x), r1=161(y), r2=69(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 161
LDI r2, 69
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
