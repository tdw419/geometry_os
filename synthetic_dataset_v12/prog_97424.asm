; DESCRIPTION: Draws a orange rectangle at (189, 74) with width 80 and height 61.
; PLAN: r0=189(x), r1=74(y), r2=80(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 74
LDI r2, 80
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
