; DESCRIPTION: Renders a orange box of size 111x112 starting at (75, 110).
; PLAN: r0=75(x), r1=110(y), r2=111(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 110
LDI r2, 111
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
