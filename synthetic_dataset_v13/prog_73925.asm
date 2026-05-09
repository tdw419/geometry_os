; DESCRIPTION: Draws a orange rectangle at (241, 95) with width 120 and height 108.
; PLAN: r0=241(x), r1=95(y), r2=120(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 95
LDI r2, 120
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
