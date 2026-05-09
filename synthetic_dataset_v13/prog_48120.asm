; DESCRIPTION: Draws a orange rectangle at (277, 3) with width 42 and height 100.
; PLAN: r0=277(x), r1=3(y), r2=42(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 3
LDI r2, 42
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
