; DESCRIPTION: Draws a orange rectangle at (299, 48) with width 76 and height 72.
; PLAN: r0=299(x), r1=48(y), r2=76(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 48
LDI r2, 76
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
