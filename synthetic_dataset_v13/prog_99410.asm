; DESCRIPTION: Draws a orange rectangle at (275, 51) with width 45 and height 14.
; PLAN: r0=275(x), r1=51(y), r2=45(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 51
LDI r2, 45
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
