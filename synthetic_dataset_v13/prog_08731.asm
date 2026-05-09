; DESCRIPTION: Renders a orange box of size 68x100 starting at (201, 124).
; PLAN: r0=201(x), r1=124(y), r2=68(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 124
LDI r2, 68
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
