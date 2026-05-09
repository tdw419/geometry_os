; DESCRIPTION: Renders a orange box of size 37x68 starting at (448, 100).
; PLAN: r0=448(x), r1=100(y), r2=37(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 100
LDI r2, 37
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
