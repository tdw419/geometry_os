; DESCRIPTION: Draws a orange rectangle at (315, 168) with width 61 and height 10.
; PLAN: r0=315(x), r1=168(y), r2=61(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 168
LDI r2, 61
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
