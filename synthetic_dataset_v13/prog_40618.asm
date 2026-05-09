; DESCRIPTION: Draws a orange rectangle at (152, 55) with width 120 and height 20.
; PLAN: r0=152(x), r1=55(y), r2=120(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 55
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
