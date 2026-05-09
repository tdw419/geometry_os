; DESCRIPTION: Places a orange 10x110 rectangle at position (414, 20).
; PLAN: r0=414(x), r1=20(y), r2=10(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 20
LDI r2, 10
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
