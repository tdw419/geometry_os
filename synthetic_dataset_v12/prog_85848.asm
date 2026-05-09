; DESCRIPTION: Draws a orange rectangle at (292, 16) with width 83 and height 120.
; PLAN: r0=292(x), r1=16(y), r2=83(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 16
LDI r2, 83
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
