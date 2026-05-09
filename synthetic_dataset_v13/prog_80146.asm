; DESCRIPTION: Draws a orange rectangle at (387, 33) with width 76 and height 50.
; PLAN: r0=387(x), r1=33(y), r2=76(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 33
LDI r2, 76
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
