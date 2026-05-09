; DESCRIPTION: Draws a orange rectangle at (401, 194) with width 17 and height 50.
; PLAN: r0=401(x), r1=194(y), r2=17(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 194
LDI r2, 17
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
