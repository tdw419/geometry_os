; DESCRIPTION: Draws a orange rectangle at (403, 164) with width 18 and height 83.
; PLAN: r0=403(x), r1=164(y), r2=18(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 164
LDI r2, 18
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
