; DESCRIPTION: Draws a orange rectangle at (450, 146) with width 14 and height 55.
; PLAN: r0=450(x), r1=146(y), r2=14(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 146
LDI r2, 14
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
