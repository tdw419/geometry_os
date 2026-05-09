; DESCRIPTION: Draws a orange rectangle at (365, 47) with width 72 and height 47.
; PLAN: r0=365(x), r1=47(y), r2=72(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 47
LDI r2, 72
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
