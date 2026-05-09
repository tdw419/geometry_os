; DESCRIPTION: Draws a orange rectangle at (277, 44) with width 50 and height 92.
; PLAN: r0=277(x), r1=44(y), r2=50(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 44
LDI r2, 50
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
