; DESCRIPTION: Draws a orange rectangle at (225, 164) with width 40 and height 92.
; PLAN: r0=225(x), r1=164(y), r2=40(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 164
LDI r2, 40
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
