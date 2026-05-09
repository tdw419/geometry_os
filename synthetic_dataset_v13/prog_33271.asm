; DESCRIPTION: Draws a orange rectangle at (308, 23) with width 54 and height 51.
; PLAN: r0=308(x), r1=23(y), r2=54(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 23
LDI r2, 54
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
